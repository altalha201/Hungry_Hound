import 'package:get/get.dart';

import '../../data/services/cloud_store_helper.dart';

class OrderStatusController extends GetxController {
  Future<void> cancelOrder(
    String orderID,
    String customerID,
    String restaurantID,
  ) async {
    final restaurantRef = await CloudStorageHelper()
        .cloudRef
        .collection("restaurant_items")
        .doc("order")
        .collection(restaurantID)
        .doc(orderID)
        .get();
    restaurantRef.reference.delete();

    await CloudStorageHelper()
        .cloudRef
        .collection("customer_item")
        .doc("order")
        .collection(customerID)
        .doc(orderID)
        .update({'order_status': "Cancel"});
  }

  Future<void> updateOrderStatus(
    String orderID,
    String customerID,
    String restaurantID,
    String newStatus,
  ) async {
    await CloudStorageHelper()
        .cloudRef
        .collection("restaurant_items")
        .doc("ongoing")
        .collection(restaurantID)
        .doc(orderID)
        .update({'order_status': newStatus});

    await CloudStorageHelper()
        .cloudRef
        .collection("customer_item")
        .doc("order")
        .collection(customerID)
        .doc(orderID)
        .update({'order_status': newStatus});
  }

  Future<void> deleteFromCustomerList(
    String orderID,
    String customerID,
  ) async {
    final restaurantRef = await CloudStorageHelper()
        .cloudRef
        .collection("customer_item")
        .doc("order")
        .collection(customerID)
        .doc(orderID)
        .get();
    restaurantRef.reference.delete();
  }
}
