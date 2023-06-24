import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../utils/text_styles.dart';
import '../../widget/button_widgets/dual_text_button.dart';
import '../../widget/loading_widget.dart';
import 'create_profile_screen.dart';
import 'login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _createUserKey = GlobalKey<FormState>();
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
                key: _createUserKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Join with us",
                      style: headlineTextStyle(),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    TextFormField(
                      controller: _emailET,
                      decoration: const InputDecoration(hintText: "Email"),
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
                      controller: _passET,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: "Password"),
                      validator: (value) {
                        if ((value?.length ?? 0) < 6) {
                          return "Password must be 6 digit or more";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration:
                          const InputDecoration(hintText: "Reenter Password"),
                      validator: (value) {
                        if(value != _passET.text) {
                          return "Password not matched";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: GetBuilder<AuthController>(
                        builder: (authController) {
                          if (authController.creatingAccount) {
                            return const LoadingWidget();
                          }
                          return ElevatedButton(
                            child: const Text("Sign up"),
                            onPressed: () async {
                              if(_createUserKey.currentState!.validate()) {
                                final response = await authController.createAccount(_emailET.text.trim(), _passET.text);
                                if (response) {
                                  Get.off(const CreateProfileScreen());
                                }
                              }
                            },
                          );
                        }
                      ),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    DualTextButton(
                      onTap: () {
                        Get.off(const LoginScreen());
                      },
                      question: "Have an account?",
                      todo: "Log in",
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
