import 'package:to_do/config/local/dao/task_dao.dart';
import 'package:to_do/ui/presenters/todo_list/domain/model/task_model.dart';

class TaskRepository {
  Future<List<Task>> getTaskList() {
    return TaskDao().getTaskList();
  }

  Future<int> deleteTask(int id) {
    return TaskDao().deleteTask(id);
  }

  Future<int> updateTask(Task task) {
    return TaskDao().updateTask(task);
  }
}
