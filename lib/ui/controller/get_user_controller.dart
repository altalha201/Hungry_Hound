import 'package:get/get.dart';

import '../../data/model/customer_model.dart';
import '../../data/model/restaurant_model.dart';
import '../../data/services/cloud_store_helper.dart';
import 'cache_controller.dart';

class GetUserController extends GetxController {

  bool _gettingUser = false;

  bool get gettingUser => _gettingUser;

  RestaurantModel _restaurant = RestaurantModel();
  CustomerModel _customer = CustomerModel();

  RestaurantModel get restaurant => _restaurant;
  CustomerModel get customer => _customer;

  Future<bool> userIsCustomer(String userID) async {
    final response = await CloudStorageHelper().getUserRole(userID);
    if(response.isSuccessful && response.returnData == "customer") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getRestaurant() async {
    _gettingUser = true;
    update();
    final response = await CloudStorageHelper().getRestaurant(Get.find<CacheController>().userId!);
    _gettingUser = false;
    if (response.isSuccessful) {
      _restaurant = response.returnData;
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getCustomer() async {
    _gettingUser = true;
    update();
    final response = await CloudStorageHelper().getCustomer(Get.find<CacheController>().userId!);
    _gettingUser = false;
    if (response.isSuccessful) {
      _customer = response.returnData;
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}