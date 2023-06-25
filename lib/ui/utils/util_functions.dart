import 'dart:convert';

import 'package:image_picker/image_picker.dart';

Future<String> convertToBase64String(XFile image) async {
  List<int> imageBytes = await image.readAsBytes();
  return base64Encode(imageBytes);
}

getBase64Image(String base64String) {
  return base64Decode(base64String);
}