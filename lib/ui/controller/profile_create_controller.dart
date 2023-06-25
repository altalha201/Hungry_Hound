import 'package:get/get.dart';

import '../../data/model/customer_model.dart';
import '../../data/model/restaurant_model.dart';
import '../../data/services/cloud_store_helper.dart';

class ProfileCreateController extends GetxController {
  bool _creatingProfile = false;

  bool get creatingProfile => _creatingProfile;

  Future<bool> createRestaurant(RestaurantModel restaurant) async {
    _creatingProfile = true;
    update();
    final response = await CloudStorageHelper().addRestaurant(restaurant);
    _creatingProfile = false;
    if (response.isSuccessful) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> createCustomer(CustomerModel customer) async {
    _creatingProfile = true;
    update();
    final response = await CloudStorageHelper().addCustomer(customer);
    _creatingProfile = false;
    if (response.isSuccessful) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}