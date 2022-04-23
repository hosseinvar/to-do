import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do/base/enums/request_status.dart';
import 'package:to_do/config/constanse.dart';
import 'package:to_do/ui/presenters/add_todo/bloc/add_todo_cubit.dart';
import 'package:to_do/ui/theme/colors.dart';
import 'package:to_do/ui/theme/theme.dart';

import '../todo_list/domain/model/task_model.dart';
import 'bloc/add_todo_state.dart';

class AddTodo extends StatelessWidget {
  final Task? task;

  const AddTodo({Key? key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: veryLightGray,
      appBar: appBar(
          context,
          task == null
              ? AppLocalizations.of(context)!.addTodo
              : AppLocalizations.of(context)!.updateTodo,
          true),
      body: AddTodoBody(
        task: task,
      ),
    );
  }
}

class AddTodoBody extends StatelessWidget {
  final Task? task;

  AddTodoBody({Key? key, this.task}) : super(key: key);

  final _dateController = TextEditingController();
  late List<String> _priorities;

  _handleDatePicker(BuildContext context, DateTime dateTime) async {
    final DateTime? date = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: mainColor,
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (date != null && date != dateTime) {
      _dateController.text = dateFormatter(date);

      context.read<AddTodoCubit>().addDate(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    _priorities = [
      AppLocalizations.of(context)!.low,
      AppLocalizations.of(context)!.medium,
      AppLocalizations.of(context)!.high
    ];

    if (task != null) {
      _dateController.text = dateFormatter(task!.date!);
    }

    return BlocProvider<AddTodoCubit>(
      create: (context) => AddTodoCubit(AddTodoState())..initUpdate(task),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: BlocConsumer<AddTodoCubit, AddTodoState>(
                    listener: (context, state) {
                  if (state.requestStatus == AsyncRequestStatus.Success) {
                    Navigator.of(context).pop(true);
                  }
                }, builder: (context, state) {
                  return Column(mainAxisSize: MainAxisSize.max, children: <
                      Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.subtitle1,
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.title,
                            labelStyle: Theme.of(context).textTheme.subtitle2,
                            border: outLineInputBorder(),
                            focusedBorder: outLineInputBorder(focused: true),
                            errorBorder: outLineInputBorder()),
                        validator: (input) => input!.trim().isEmpty
                            ? AppLocalizations.of(context)!.validateTitle
                            : null,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            context.read<AddTodoCubit>().addTitle(value);
                          }
                        },
                        initialValue: state.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        readOnly: true,
                        controller: _dateController,
                        style: Theme.of(context).textTheme.subtitle1,
                        onTap: () => _handleDatePicker(
                            context, state.date ?? DateTime.now()),
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.date,
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                          border: outLineInputBorder(),
                          focusedBorder: outLineInputBorder(focused: true),
                          errorBorder: outLineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: DropdownButtonFormField(
                        isDense: true,
                        value: state.priority,
                        icon: const Icon(Icons.arrow_drop_down_circle),
                        iconSize: 20.0,
                        iconEnabledColor: Theme.of(context).primaryColor,
                        style: Theme.of(context).textTheme.subtitle1,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.priority,
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                          border: outLineInputBorder(),
                          focusedBorder: outLineInputBorder(focused: true),
                          errorBorder: outLineInputBorder(),
                        ),
                        validator: (dynamic input) =>
                            input.toString().trim().isEmpty
                                ? AppLocalizations.of(context)!.validatePriority
                                : null,
                        items: _priorities.map((String priority) {
                          return DropdownMenuItem(
                            value: priority,
                            child: Text(priority,
                                style: Theme.of(context).textTheme.subtitle1),
                          );
                        }).toList(),
                        onChanged: (dynamic newValue) {
                          context
                              .read<AddTodoCubit>()
                              .addPriority(newValue.toString());
                        }, // value : _priority
                      ),
                    ),
                    const Spacer(flex: 5),
                    Flexible(
                      child: Container(
                        height: 56.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: state.title!.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : avgGray,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: TextButton(
                          onPressed: () {
                            if (state.title!.isNotEmpty) {
                              context.read<AddTodoCubit>().insertTask(task);
                            }
                          },
                          child: state.requestStatus ==
                                  AsyncRequestStatus.Submitting
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text(
                                  task == null
                                      ? AppLocalizations.of(context)!.add
                                      : AppLocalizations.of(context)!.update,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: state.title!.isNotEmpty
                                              ? Colors.white
                                              : Colors.black),
                                ),
                        ),
                      ),
                    )
                  ]);
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
