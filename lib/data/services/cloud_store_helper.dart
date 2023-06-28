import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/cart_item_model.dart';
import '../model/customer_model.dart';
import '../model/menu_item_model.dart';
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

  Future<ResponseModel> getRestaurants() async {
    final ref = cloudRef.collection("restaurants");
    List<RestaurantModel> returnList = [];
    await ref.get().then((documents) {
      for (var doc in documents.docs) {
        returnList.add(RestaurantModel.fromJson(doc.data()));
      }
    });
    return ResponseModel(isSuccessful: true, returnData: returnList);
  }

  Future<ResponseModel> createItem(MenuItemModel item) async {
    await cloudRef
        .collection("restaurant_items")
        .doc("menu")
        .collection(item.restaurantId!)
        .doc(item.itemId)
        .set(item.toJson());

    return ResponseModel(isSuccessful: true);
  }

  Future<ResponseModel> getMenuItemByRestaurantID(String restaurantID) async {
    final ref = cloudRef
        .collection("restaurant_items")
        .doc("menu")
        .collection(restaurantID);

    List<MenuItemModel> items = [];
    await ref.get().then((documents) {
      for (var docs in documents.docs) {
        items.add(MenuItemModel.fromJson(docs.data()));
      }
    });

    return ResponseModel(isSuccessful: true, returnData: items);
  }

  Future<ResponseModel> addToWishList(String userID, MenuItemModel item) async {
    await cloudRef
        .collection("customer_item")
        .doc("wishlist")
        .collection(userID)
        .doc(item.itemId)
        .set(item.toJson());
    return ResponseModel(isSuccessful: true);
  }

  Future<ResponseModel> getWishlist(String userID) async {
    final ref =
        cloudRef.collection("customer_item").doc("wishlist").collection(userID);
    List<MenuItemModel> items = [];
    await ref.get().then((documents) {
      for (var docs in documents.docs) {
        items.add(MenuItemModel.fromJson(docs.data()));
      }
    });
    return ResponseModel(isSuccessful: true, returnData: items);
  }

  Future<ResponseModel> addToCart(CartItemModel cartItem) async {
    await cloudRef
        .collection("customer_item")
        .doc("cart")
        .collection(cartItem.customerId!)
        .doc(cartItem.itemId)
        .set(cartItem.toJson());
    return ResponseModel(isSuccessful: true);
  }

  Future<ResponseModel> getCartList(String customerID) async {
    final ref = cloudRef.collection("customer_item").doc("cart").collection(customerID);
    List<CartItemModel> items = [];
    await ref.get().then((documents) {
      for (var docs in documents.docs) {
        items.add(CartItemModel.fromJson(docs.data()));
      }
    });
    return ResponseModel(isSuccessful: true, returnData: items);
  }
}
