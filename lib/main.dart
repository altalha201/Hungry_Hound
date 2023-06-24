import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'store_bindings.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/utils/theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
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
