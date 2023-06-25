import 'dart:convert';
import 'dart:io';

Future<String> convertToBase64String(File image) async {
  List<int> imageBytes = await image.readAsBytes();
  return base64Encode(imageBytes);
}

getBase64Image(String base64String) {
  return base64Decode(base64String);
}