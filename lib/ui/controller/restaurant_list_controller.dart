import 'package:get/get.dart';

import '../../data/model/restaurant_model.dart';
import '../../data/services/cloud_store_helper.dart';

class RestaurantListController extends GetxController {

  bool _gettingRestaurants = false;

  List<RestaurantModel> _restaurants = [];

  bool get gettingRestaurants => _gettingRestaurants;

  List<RestaurantModel> get restaurants => _restaurants;

  Future<bool> getRestaurantList() async {
    _gettingRestaurants = true;
    update();
    final response = await CloudStorageHelper().getRestaurants();
    _gettingRestaurants = false;
    if (response.isSuccessful) {
      _restaurants = response.returnData;
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}