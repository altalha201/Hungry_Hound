import 'package:get/get.dart';

import 'ui/controller/auth_controller.dart';
import 'ui/controller/cache_controller.dart';

class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(CacheController());
  }
}