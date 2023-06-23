import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class DualTextButton extends StatelessWidget {

  final String question;
  final String todo;
  final VoidCallback? onTap;

  const DualTextButton({
    Key? key,
    required this.question,
    required this.todo,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: const TextStyle(
              color: colorPrimaryBlack,
              fontSize: 13,
              fontWeight: FontWeight.w200,
            ),
          ),
          const SizedBox(width: 4.0),
          Text(
            todo,
            style: const TextStyle(
              color: colorPrimaryGreen,
              fontSize: 13,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}