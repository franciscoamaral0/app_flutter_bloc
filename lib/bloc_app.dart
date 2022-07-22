import 'package:badges/badges.dart';
import 'package:bloc_project/blocs/task_bloc.dart';
import 'package:bloc_project/blocs/task_state.dart';
import 'package:bloc_project/components/add_task_bottom_sheet.dart';
import 'package:bloc_project/components/card.dart';
import 'package:bloc_project/models/task.dart';
import 'package:bloc_project/resources/color.dart';
import 'package:bloc_project/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloc_project/utils/task_helper.dart' as task_utils;

class BlocApp extends StatefulWidget {
  const BlocApp({
    Key? key,
  }) : super(key: key);

  @override
  State<BlocApp> createState() => _BlocAppState();
}

class _BlocAppState extends State<BlocApp> {
  final listTasks = List<Task>.from(task_utils.tasks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaskColors.backgroundScaffold,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: TaskColors.colorAppbar,
        title: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return Badge(
              showBadge: !state.task.isEmpty,
              position: BadgePosition.topStart(top: -12, start: 89),
              badgeColor: TaskColors.redColor,
              badgeContent: Text(state.task.length.toString()),
              animationDuration: const Duration(milliseconds: 200),
              animationType: BadgeAnimationType.scale,
              child: Text(
                Strings.appName,
                style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(
                          0xFF484654,
                        ))),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.task.length,
                  itemBuilder: (context, index) {
                    final taskItem = state.task[index];
                    return CardTask(
                        title: taskItem.name,
                        subtitle: taskItem.subtitle,
                        date: taskItem.date.toString());
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) =>
              FractionallySizedBox(heightFactor: 0.3, child: AddTaskButton()),
          barrierColor: Colors.black.withOpacity(0.7),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
        ),
        backgroundColor: TaskColors.buttonAddBackgorundColor,
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
// CardTask(
//                   title: "tarefa1",
//                   subtitle: "tarefa2",
//                   date: DateFormat.yMd().format(DateTime.now())),

// Badge(
//           badgeColor: TaskColors.redColor,
//           badgeContent: Text("2"),
//           animationDuration: const Duration(milliseconds: 200),
//           animationType: BadgeAnimationType.scale,
//           child: