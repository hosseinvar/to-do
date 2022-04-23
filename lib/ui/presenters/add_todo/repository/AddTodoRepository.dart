import '../../../../config/local/dao/task_dao.dart';
import '../../todo_list/domain/model/task_model.dart';

class AddTodoRepository{
  Future<int> insertTask(Task task) {
    return TaskDao().insertTask(task);
  }

  Future<int> updateTask(Task task) {
    return TaskDao().updateTask(task);
  }
}