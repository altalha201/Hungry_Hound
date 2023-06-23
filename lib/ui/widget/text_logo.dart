import 'package:flutter/material.dart';

import '../utils/application_colors.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "Hungry",
          style: TextStyle(color: colorPrimaryBlack, fontFamily: "Rundeck"),
        ),
        SizedBox(
          width: 4.0,
        ),
        Text(
          "Hound",
          style: TextStyle(color: colorPrimaryGreen, fontFamily: "Rundeck"),
        )
      ],
    );
  }
}
