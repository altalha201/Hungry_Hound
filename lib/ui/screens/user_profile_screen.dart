import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/get_user_controller.dart';
import '../utils/application_colors.dart';
import '../utils/text_styles.dart';
import '../utils/util_functions.dart';
import '../widget/app_bars/customer_app_bar.dart';
import '../widget/drawer_menus/customer_menu.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customerAppBar(),
      drawer: CustomerMenu(customer: Get.find<GetUserController>().customer, fromProfile: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.000),
        child: GetBuilder<GetUserController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 120,
                  backgroundColor: colorPrimaryGreen,
                  child: CircleAvatar(
                    radius: 116,
                    backgroundColor: colorPrimaryGreen,
                    backgroundImage: MemoryImage(getBase64Image(controller.customer.img ?? "")),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 32.0,
                ),
                Text(controller.customer.userName ?? "", style: headlineTextStyle().copyWith(color: colorPrimaryBlack),),
              ],
            );
          },
        ),
      ),
    );
  }
}
