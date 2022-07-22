import 'dart:async';

import 'package:bloc_project/blocs/task_event.dart';
import 'package:bloc_project/blocs/task_state.dart';
import 'package:bloc_project/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState(task: [])) {
    on<TaskAdded>(_onTaskAdded);
    on<TaskRemoved>(_onTaskRemoved);
  }

  void _onTaskAdded(TaskAdded event, Emitter<TaskState> emit) {
    final newTask = List<Task>.from(state.task);

    newTask.add(event.task);

    emit(TaskState(task: newTask));
  }

  void _onTaskRemoved(TaskRemoved event, Emitter<TaskState> emit) {
    final newTask = List<Task>.from(state.task);

    final taskItem = state.task
        .firstWhereOrNull((taskItem) => taskItem.name == event.task.name);
    newTask.remove(taskItem);

    emit(TaskState(task: newTask));
  }
}
