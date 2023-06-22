import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store_bindings.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/utils/theme_data.dart';

void main() {
  runApp(const HungryHound());
}

class HungryHound extends StatelessWidget {
  const HungryHound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Hungry Hound",
      debugShowCheckedModeBanner: false,
      theme: hungryHoundTheme(),
      initialBinding: StoreBindings(),
      home: const SplashScreen(),
    );
  }
}
