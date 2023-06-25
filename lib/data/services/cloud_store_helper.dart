import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/customer_model.dart';
import '../model/response_model.dart';
import '../model/restaurant_model.dart';

class CloudStorageHelper {
  final cloudRef = FirebaseFirestore.instance;

  Future<ResponseModel> addRestaurant(RestaurantModel restaurant) async {
    await cloudRef
        .collection("user_role")
        .doc(restaurant.restaurantId)
        .set({"uid": restaurant.restaurantId, "role": "restaurant"});
    await cloudRef
        .collection("restaurants")
        .doc(restaurant.restaurantId)
        .set(restaurant.toJson());

    return ResponseModel(isSuccessful: true);
  }

  Future<ResponseModel> addCustomer(CustomerModel customerModel) async {
    await cloudRef
        .collection("user_role")
        .doc(customerModel.userId)
        .set({"uid": customerModel.userId, "role": "customer"});
    await cloudRef
        .collection("customers")
        .doc(customerModel.userId)
        .set(customerModel.toJson());

    return ResponseModel(isSuccessful: true);
  }

  Future<ResponseModel> getUserRole(String userID) async {
    final ref = cloudRef.collection("user_role").doc(userID);
    late final String role;
    await ref.get().then((value) {
      final data = value.data() as Map<String, dynamic>;
      role = data['role'];
      log(role);
    });
    return ResponseModel(isSuccessful: true, returnData: role);
  }
  
  Future<ResponseModel> getRestaurant(String id) async {
    final ref = cloudRef.collection("restaurants").doc(id);
    late final Map<String, dynamic>? data;
    await ref.get().then((value) {
      data = value.data();
    });
    RestaurantModel restaurant = RestaurantModel.fromJson(data!);
    if (restaurant.restaurantId != null) {
      return ResponseModel(isSuccessful: true, returnData: restaurant);
    } else {
      return ResponseModel(isSuccessful: false);
    }
  }

  Future<ResponseModel> getCustomer(String id) async {
    final ref = cloudRef.collection("customers").doc(id);
    late final Map<String, dynamic>? data;
    await ref.get().then((value) {
      data = value.data();
    });
    CustomerModel customer = CustomerModel.fromJson(data!);
    if (customer.userId != null) {
      return ResponseModel(isSuccessful: true, returnData: customer);
    } else {
      return ResponseModel(isSuccessful: false);
    }
  }
}
