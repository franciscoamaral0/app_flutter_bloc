import 'package:bloc_project/models/task.dart';
import 'package:intl/intl.dart';

final tasks = [
  Task(
      name: "tarefa1",
      subtitle: "fazer terefa1",
      date: DateFormat.yMd().format(DateTime.now())),
  Task(
      name: "tarefa2",
      subtitle: "fazer terefa2",
      date: DateFormat.yMd().format(DateTime.now())),
  Task(
      name: "tarefa3",
      subtitle: "fazer terefa3",
      date: DateFormat.yMd().format(DateTime.now())),
  Task(
      name: "tarefa4",
      subtitle: "fazer terefa4",
      date: DateFormat.yMd().format(DateTime.now())),
];
