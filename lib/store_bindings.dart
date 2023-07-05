import 'package:get/get.dart';

import 'ui/controller/auth_controller.dart';
import 'ui/controller/cache_controller.dart';
import 'ui/controller/cart_controller.dart';
import 'ui/controller/get_user_controller.dart';
import 'ui/controller/menu_item_controller.dart';
import 'ui/controller/order_controller.dart';
import 'ui/controller/order_list_change_controller.dart';
import 'ui/controller/order_status_controller.dart';
import 'ui/controller/profile_create_controller.dart';
import 'ui/controller/restaurant_list_controller.dart';
import 'ui/controller/review_controller.dart';
import 'ui/controller/wish_list_controller.dart';

class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(CacheController());
    Get.put(CartController());
    Get.put(GetUserController());
    Get.put(MenuItemController());
    Get.put(OrderController());
    Get.put(OrderListChangeController());
    Get.put(OrderStatusController());
    Get.put(ProfileCreateController());
    Get.put(RestaurantListController());
    Get.put(ReviewController());
    Get.put(WishListController());
  }
}