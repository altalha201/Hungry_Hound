import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/application_colors.dart';

class ImageSelectingButton extends StatelessWidget {
  ImageSelectingButton({
    Key? key, required this.onPicked,
  }) : super(key: key);

  final Function(File? picked) onPicked;
  final TextEditingController imgController = TextEditingController();

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
                  onPressed: () async {
                    await Get.defaultDialog(
                      title: "Pick Image form",
                      content: Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              final pickedImg = await ImagePicker().pickImage(source: ImageSource.camera, maxHeight: 288, maxWidth: 512);
                              if (pickedImg != null) {
                                imgController.text = pickedImg.name;
                                onPicked(File(pickedImg.path));
                              }
                              Get.back();
                            },
                            leading:  const Icon(Icons.camera_alt_outlined, size: 34, color: colorPrimaryGreen,),
                            title: const Text("Camera"),
                          ),
                          ListTile(
                            onTap: () async {
                              final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 288, maxWidth: 512);
                              if (pickedImg != null) {
                                imgController.text = pickedImg.name;
                                onPicked(File(pickedImg.path));
                              }
                              Get.back();
                            },
                            leading:  const Icon(Icons.image_outlined, size: 34, color: colorPrimaryGreen,),
                            title: const Text("Gallery"),
                          )
                        ],
                      ),
                      textCancel: "Cancel",
                      onCancel: () {
                        Get.back();
                      }
                    );
                  },
                  child: const Text("Choose a Photo"))),
          Expanded(
            child: SizedBox(
              height: 55,
              child: TextFormField(
                controller: imgController,
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
