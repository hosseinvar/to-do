import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do/base/enums/request_status.dart';
import 'package:to_do/ui/presenters/todo_list/bloc/todo_list_cubit.dart';
import 'package:to_do/ui/router/router.dart';
import 'package:to_do/ui/theme/colors.dart';

import '../../../config/constanse.dart';
import '../../theme/theme.dart';
import 'bloc/todo_list_state.dart';
import 'domain/model/task_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoListCubit>(
      create: (context) => TodoListCubit(TodoListState())..getTaskList(),
      child: Scaffold(
        backgroundColor: veryLightGray,
        appBar: appBar(context, AppLocalizations.of(context)!.todoApp, false),
        body: const TodoBody(),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.addTodo).then((value) {
                if (value as bool) {
                  context.read<TodoListCubit>().getTaskList();
                }
              });
            },
            backgroundColor: mainColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          );
        }),
      ),
    );
  }
}

class TodoBody extends StatelessWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            BlocBuilder<TodoListCubit, TodoListState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.myTasks,
                        style: Theme.of(context).textTheme.headline2),
                    Text(
                      "${state.completedTaskCount} " +
                          AppLocalizations.of(context)!.ofs +
                          " ${state.taskList!.length}",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1,
              color: gray.withOpacity(.5),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<TodoListCubit, TodoListState>(
                builder: (context, state) {
              if (state.requestStatus == AsyncRequestStatus.Submitting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.requestStatus == AsyncRequestStatus.Success &&
                  state.taskList!.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.noTask,
                        style: Theme.of(context).textTheme.subtitle2),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                    itemCount: state.taskList!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => TodoListItem(
                          task: state.taskList![index],
                        )),
              );
            })
          ],
        ),
      ),
    );
  }
}

class TodoListItem extends StatelessWidget {
  final Task? task;

  const TodoListItem({Key? key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: cardBoxDecoration()
          .copyWith(color: task!.status == 0 ? Colors.white : doneGray),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          task!.title!,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              decoration: task!.status == 0
                  ? TextDecoration.none
                  : TextDecoration.lineThrough),
        ),
        subtitle: Text(
          '${dateFormatter(task!.date!)} * ${task!.priority}',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              decoration: task!.status == 0
                  ? TextDecoration.none
                  : TextDecoration.lineThrough),
        ),
        leading: Checkbox(
          onChanged: (value) {
            context
                .read<TodoListCubit>()
                .updateTask(task!.copyWith(status: task!.status == 0 ? 1 : 0));
          },
          activeColor: mainColor,
          value: task!.status == 0 ? false : true,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(maxWidth: 30),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.addTodo, arguments: task)
                    .then((value) {
                  if (value as bool) {
                    context.read<TodoListCubit>().getTaskList();
                  }
                });
              },
              iconSize: 20,
              icon: const Icon(
                Icons.edit,
                color: gray,
              ),
            ),
            const VerticalDivider(
              color: gray,
              thickness: 1,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(maxWidth: 30),
              onPressed: () {
                context.read<TodoListCubit>().deleteTask(task!);
              },
              iconSize: 20,
              icon: const Icon(
                Icons.delete,
                color: gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
