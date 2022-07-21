import 'package:bloc_project/resources/color.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  SquareButton(
      {Key? key,
      required this.icone,
      required this.cor,
      required this.onClickFunction})
      : super(key: key);

  final VoidCallback onClickFunction;
  var icone;
  Color cor;
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        color: cor,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: IconButton(
        onPressed: onClickFunction,
        icon: Icon(
          icone,
        ),
        color: Colors.white,
        iconSize: 25,
        padding: EdgeInsets.zero,
        splashRadius: 20.0,
        constraints: const BoxConstraints(),
      ),
    );
  }
}
