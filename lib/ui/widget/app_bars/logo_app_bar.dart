import 'package:flutter/material.dart';

AppBar logoAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(60),
        bottomLeft: Radius.circular(60),
      ),
    ),
    title: Image.asset(
      "assets/images/logo.png",
      width: 40,
    ),
    centerTitle: true,
  );
}