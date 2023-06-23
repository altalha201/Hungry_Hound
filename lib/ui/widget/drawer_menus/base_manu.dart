import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/auth_screens/create_account_screen.dart';
import '../../screens/auth_screens/login_screen.dart';
import '../../utils/application_colors.dart';

class BaseManu extends StatelessWidget {
  const BaseManu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: colorPrimaryGreen, width: 1.0),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: EdgeInsets.zero,
              child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 80,
                      ),
                      const Text(
                        "Welcome to Hungry Hound",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )),
            ),
            ListTile(
              onTap: () {
                Get.to(const LoginScreen());
              },
              leading: const Icon(
                Icons.login_sharp,
              ),
              title: const Text("Sign in"),
            ),
            ListTile(
              onTap: () {
                Get.to(const CreateAccountScreen());
              },
              leading: const Icon(
                Icons.create_sharp,
              ),
              title: const Text("Create account"),
            )
          ],
        ),
      ),
    );
  }
}
