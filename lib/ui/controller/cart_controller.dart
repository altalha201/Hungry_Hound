import 'package:get/get.dart';

import '../../data/model/cart_item_model.dart';
import '../../data/services/cloud_store_helper.dart';
import 'cache_controller.dart';

class CartController extends GetxController {
  bool _addingToCart = false, _gettingCartList = false;

  List<CartItemModel> _cartList = [];

  bool get addingToCart => _addingToCart;
  bool get gettingCartList => _gettingCartList;
  List<CartItemModel> get cartList => _cartList;

  Future<bool> addToCart(CartItemModel cartItem) async {
    _addingToCart = true;
    update();
    final response = await CloudStorageHelper().addToCart(cartItem);
    _addingToCart = false;
    if (response.isSuccessful) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getCartList() async {
    _gettingCartList = true;
    update();
    final response = await CloudStorageHelper().getCartList(Get.find<CacheController>().userId!);
    _gettingCartList = false;
    if (response.isSuccessful) {
      _cartList = response.returnData;
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}