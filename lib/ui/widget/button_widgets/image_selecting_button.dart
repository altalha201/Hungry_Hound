import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class ImageSelectingButton extends StatelessWidget {
  const ImageSelectingButton({
    Key? key, this.onPressed, this.textController,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          SizedBox(
              height: 55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ))),
                  onPressed: onPressed,
                  child: const Text("Choose a Photo"))),
          Expanded(
            child: SizedBox(
              height: 55,
              child: TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                    hintText: "Selected Image",
                    enabled: false,
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: colorPrimaryGreen),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        )
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
