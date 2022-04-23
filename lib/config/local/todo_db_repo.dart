

import 'package:to_do/config/local/todo_db.dart';

class TodoDbRepo {
  TodoDbRepo._();

  static TodoDbRepo db = new TodoDbRepo._();

  TodoDatabase? database;

  init() async{
    database = TodoDatabase();
  }
}
