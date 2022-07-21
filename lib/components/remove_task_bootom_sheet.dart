import 'package:bloc_project/components/square_button.dart';
import 'package:bloc_project/resources/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

const _removeTaskPadding = EdgeInsets.only(left: 76, right: 70, top: 28);

class RemoveTask extends StatelessWidget {
  const RemoveTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _removeTaskPadding,
      child: Column(
        children: [
          Text(
            "Deseja remover 'Task A'?",
            style: GoogleFonts.rubik(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 42),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SquareButton(
              icone: Icons.done_all_rounded,
              cor: TaskColors.buttonConfirmBackgroundColor,
            ),
            const SizedBox(width: 10),
            SquareButton(
                icone: Icons.cancel_presentation_rounded,
                cor: TaskColors.redColor),
            const SizedBox(height: 10)
          ])
        ],
      ),
    );
  }
}
