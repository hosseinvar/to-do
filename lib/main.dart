import 'package:flutter/material.dart';
import 'package:to_do/ui/presenters/app/app.dart';

import 'config/local/todo_db_repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  TodoDbRepo.db.init();

  runApp(TodoApp());
}
