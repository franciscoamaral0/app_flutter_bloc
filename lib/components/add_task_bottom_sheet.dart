import 'package:bloc_project/blocs/task_bloc.dart';
import 'package:bloc_project/blocs/task_event.dart';
import 'package:bloc_project/components/square_button.dart';
import 'package:bloc_project/models/task.dart';
import 'package:bloc_project/resources/color.dart';
import 'package:bloc_project/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

const _addTaskPadding = EdgeInsets.only(left: 30, right: 30, top: 28);

class AddTaskButton extends StatelessWidget {
  AddTaskButton({Key? key}) : super(key: key);
  TextEditingController titulo = TextEditingController();
  TextEditingController descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _addTaskPadding,
      child: Column(
        children: [
          Text(
            Strings.addTask,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
                textStyle:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
          ),
          TextFormField(
            controller: titulo,
            decoration: InputDecoration(
              hintText: "Título",
              hintStyle: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500)),
            ),
          ),
          const SizedBox(height: 29),
          TextFormField(
            controller: descricao,
            decoration: InputDecoration(
              hintText: "Descrição",
              hintStyle: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500)),
            ),
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.bottomRight,
            child: SquareButton(
              icone: Icons.add,
              cor: TaskColors.buttonAddBackgorundColor,
              onClickFunction: () {
                Task newTask = Task(
                    name: titulo.text,
                    subtitle: descricao.text,
                    date: DateFormat.yMd().format(DateTime.now()));
                BlocProvider.of<TaskBloc>(context)
                    .add(TaskAdded(task: newTask));
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
