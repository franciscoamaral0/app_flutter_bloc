import 'package:bloc_project/models/task.dart';

abstract class TaskEvent {
  const TaskEvent();
}

class TaskAdded extends TaskEvent {
  final Task task;

  const TaskAdded({required this.task});
}

class TaskRemoved extends TaskEvent {
  final Task task;

  const TaskRemoved({required this.task});
}
