import 'dart:io';

import "package:path/path.dart";
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabase {
  static final TodoDatabase _instance = TodoDatabase.internal();

  static String tasksTable = 'Task';

  factory TodoDatabase() => _instance;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  TodoDatabase.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "Todo.db");
    var taskDb = await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Task` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT, `date` TEXT, `priority` TEXT, `status` INTEGER)');
      },
    );
    return taskDb;
  }
}
