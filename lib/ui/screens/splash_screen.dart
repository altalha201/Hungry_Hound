import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controller/cache_controller.dart';
import '../controller/get_user_controller.dart';
import '../utils/application_colors.dart';
import 'restaurant_owner_home_screen.dart';
import 'customer_home_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      Get.find<CacheController>().getUserID();
      if(Get.find<CacheController>().isLogin()) {
        await Get.find<GetUserController>().userIsCustomer(Get.find<CacheController>().userId!).then((value) {
          if(value) {
            Get.offAll(const CustomerHomeScreen());
          } else {
            Get.offAll(const RestaurantOwnerHomeScreen());
          }
        });
      } else {
        Get.offAll(const HomeScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo_name.png',
                width: 250,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LoadingAnimationWidget.newtonCradle(
                    color: colorPrimaryGreen, size: 140,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
