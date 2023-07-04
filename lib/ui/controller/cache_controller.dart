import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/home_screen.dart';

class CacheController extends GetxController {
  String? _userID;

  String? get userId => _userID;

  bool isLogin() {
    return _userID != null;
  }

  void saveUserID(String uID) {
    _userID = uID;
    GetStorage().write("hh_user", uID);
  }

  void getUserID() {
    _userID = GetStorage().read("hh_user");
  }

  void logout() {
    clearData();
    _userID = null;
    Get.offAll(const HomeScreen());
  }

  void clearData() {
    GetStorage().erase();
  }
}