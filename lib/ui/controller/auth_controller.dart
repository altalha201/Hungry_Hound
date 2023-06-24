import 'package:get/get.dart';

import '../../data/services/firebase_auth_helper.dart';
import 'cache_controller.dart';

class AuthController extends GetxController {
  bool _creatingAccount = false;

  bool get creatingAccount => _creatingAccount;

  Future<bool> createAccount(String email, String pass) async {
    _creatingAccount = true;
    update();

    final response = await FirebaseAuthHelper().createAuth(email: email, pass: pass);
    _creatingAccount = false;
    if (response.isSuccessful) {
      Get.find<CacheController>().saveUserID(response.returnData);
      update();
      return true;
    } else {
      if (response.returnData == 'week-password') {
        Get.showSnackbar(const GetSnackBar(
          title: "User Create Failed",
          message: "Password is week try use another password",
          duration: Duration(seconds: 3),
        ));
      } else if (response.returnData == 'email-already-in-use') {
        Get.showSnackbar(const GetSnackBar(
          title: "User Create Failed",
          message: "User already exist. try using another email",
          duration: Duration(seconds: 3),
        ));
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: "User Create Failed",
          message: "Unexpected happened. try again later",
          duration: Duration(seconds: 3),
        ));
      }
      update();
      return false;
    }
  }
}