import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../utils/text_styles.dart';
import '../../widget/button_widgets/dual_text_button.dart';
import '../../widget/loading_widget.dart';
import '../splash_screen.dart';
import 'create_account_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _emailET = TextEditingController();
  final TextEditingController _passET = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _key,
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
                      controller: _emailET,
                      validator: (value) {
                        if(value?.trim().isEmpty ?? true) {
                          return "Enter your email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(hintText: "Password"),
                      controller: _passET,
                      validator: (value) {
                        if ((value?.length ?? 0) < 6) {
                          return "Password must be 6 digit or more";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    GetBuilder<AuthController>(
                      builder: (controller) {
                        return SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: Visibility(
                            visible: !controller.loginProgressing,
                            replacement: const LoadingWidget(),
                            child: ElevatedButton(
                              child: const Text("Log in"),
                              onPressed: () async {
                                if(_key.currentState!.validate()) {
                                  final response = await controller.login(_emailET.text.trim(), _passET.text);
                                  if (response) {
                                    Get.offAll(const SplashScreen());
                                  }
                                }
                              },
                            ),
                          ),
                        );
                      }
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    DualTextButton(
                      onTap: () {
                        Get.off(CreateAccountScreen());
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
      ),
    );
  }
}
