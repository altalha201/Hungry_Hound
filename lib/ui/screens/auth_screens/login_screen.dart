import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/text_styles.dart';
import '../../widget/button_widgets/dual_text_button.dart';
import 'create_account_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lets Start",
                    style: headlineTextStyle(),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      child: const Text("Log in"),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  DualTextButton(
                    onTap: () {
                      Get.off(const CreateAccountScreen());
                    },
                    question: "Have no account?",
                    todo: "Create account",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
