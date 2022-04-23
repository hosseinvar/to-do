import 'package:to_do/config/local/todo_db.dart';
import 'package:to_do/config/local/todo_db_repo.dart';
import 'package:to_do/ui/presenters/todo_list/domain/model/task_model.dart';

class TaskDao {
  Future<List<Map<String, dynamic>>> getMapTaskList() async {
    final db = await TodoDbRepo.db.database!.db;

    final List<Map<String, dynamic>> result =
        await db.query(TodoDatabase.tasksTable);

    return result;
  }

  Future<List<Task>> getTaskList() async {
    final List<Map<String, dynamic>> taskMapList = await getMapTaskList();

    final List<Task> taskList = [];

    for (var task in taskMapList) {
      taskList.add(Task.fromJson(task));
    }

    taskList.sort((taskA, taskB) => taskA.date!.compareTo(taskB.date!));

    return taskList;
  }

  Future<int> insertTask(Task task) async {
    final db = await TodoDbRepo.db.database!.db;

    return db.insert(TodoDatabase.tasksTable, task.toJson());
  }

  Future<int> updateTask(Task task) async {
    final db = await TodoDbRepo.db.database!.db;

    return db.update(TodoDatabase.tasksTable, task.toJson(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int> deleteTask(int? id) async {
    final db = await TodoDbRepo.db.database!.db;

    return db.delete(TodoDatabase.tasksTable, where: 'id = ?', whereArgs: [id]);
  }
}
