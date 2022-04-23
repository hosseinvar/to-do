import 'package:flutter/material.dart';

import '../presenters/add_todo/add_todo.dart';
import '../presenters/todo_list/domain/model/task_model.dart';
import '../presenters/todo_list/todo_list.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case todoList:
        return _createRoute(
          const TodoList(),
        );
      case addTodo:
        if (settings.arguments != null) {
          Task task = settings.arguments as Task;
          return _createRoute(
            AddTodo(
              task: task,
            ),
          );
        }

        return _createRoute(
          AddTodo(),
        );
    }
  }

  static String initialRoute = todoList;
  static const String todoList = '/TodoList';
  static const String addTodo = '/addTodo';

  static Route _createRoute(Widget page) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation1, animation2, child) =>
            Align(child: SizeTransition(sizeFactor: animation1, child: child)),
        transitionDuration: const Duration(milliseconds: 400));
  }
}
