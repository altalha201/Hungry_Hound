import 'package:get/get.dart';

import '../../data/model/order_model.dart';
import '../../data/services/cloud_store_helper.dart';
import 'get_user_controller.dart';

class OrderController extends GetxController {
  bool _placingOrder = false, _gettingList = false;

  List<OrderModel> _orderList = [];

  bool get placingOrder => _placingOrder;

  bool get gettingList => _gettingList;

  List<OrderModel> get orderList => _orderList;

  Future<void> placeOrder() async {
    _placingOrder = true;
    update();

    await CloudStorageHelper().createOrder(
        Get.find<GetUserController>().customer.userId!,
        Get.find<GetUserController>().customer.address!);
    _placingOrder = false;
    update();
  }

  Future<bool> getCustomerOrderList() async {
    _gettingList = true;
    update();
    final response = await CloudStorageHelper()
        .getCustomerOrderList(Get.find<GetUserController>().customer.userId!);
    _gettingList = false;
    if (response.isSuccessful) {
      _orderList.clear();
      _orderList = response.returnData;
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getRestaurantOrderList() async {
    _gettingList = true;
    update();
    final response = await CloudStorageHelper().getRestaurantOrderList(
        Get.find<GetUserController>().restaurant.restaurantId!);
    _gettingList = false;
    if (response.isSuccessful) {
      _orderList.clear();
      _orderList = response.returnData;
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
