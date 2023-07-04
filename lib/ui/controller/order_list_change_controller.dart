import 'package:get/get.dart';

import '../../data/model/order_model.dart';
import '../../data/services/cloud_store_helper.dart';

class OrderListChangeController extends GetxController {

  bool _gettingList = false;
  final List<OrderModel> _list = [];

  bool get gettingList => _gettingList;
  List<OrderModel> get list => _list;

  Future<void> addToOnGoing(
      String orderID, String restaurantID) async {
    final ref = CloudStorageHelper()
        .cloudRef
        .collection("restaurant_items")
        .doc("order")
        .collection(restaurantID)
        .doc(orderID);
    late final Map<String, dynamic>? data;
    await ref.get().then((value) {
      data = value.data();
    });
    await CloudStorageHelper()
        .cloudRef
        .collection("restaurant_items")
        .doc("ongoing")
        .collection(restaurantID)
        .doc(orderID)
        .set(data!);
    final q = await ref.get();
    q.reference.delete();
  }

  Future<void> addToCompleted(
      String orderID, String restaurantID) async {
    final ref = CloudStorageHelper()
        .cloudRef
        .collection("restaurant_items")
        .doc("ongoing")
        .collection(restaurantID)
        .doc(orderID);
    late final Map<String, dynamic>? data;
    await ref.get().then((value) {
      data = value.data();
    });
    await CloudStorageHelper()
        .cloudRef
        .collection("restaurant_items")
        .doc("completed")
        .collection(restaurantID)
        .doc(orderID)
        .set(data!);
    final q = await ref.get();
    q.reference.delete();
  }

  Future<void> getList(String from, String restaurantID) async {
    _gettingList = true;
    update();
    final ref = CloudStorageHelper().cloudRef.collection("restaurant_items").doc(from).collection(restaurantID);
    _list.clear();
    await ref.get().then((document) {
      for(var docs in document.docs) {
        _list.add(OrderModel.fromJson(docs.data()));
      }
    });
    _gettingList = false;
    update();
  }
}
