import 'package:get/get.dart';

import 'ui/controller/auth_controller.dart';
import 'ui/controller/cache_controller.dart';
import 'ui/controller/get_user_controller.dart';
import 'ui/controller/menu_item_controller.dart';
import 'ui/controller/profile_create_controller.dart';
import 'ui/controller/restaurant_list_controller.dart';

class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(CacheController());
    Get.put(GetUserController());
    Get.put(MenuItemController());
    Get.put(ProfileCreateController());
    Get.put(RestaurantListController());
  }
}