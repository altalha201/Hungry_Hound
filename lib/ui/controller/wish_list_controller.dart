import 'package:get/get.dart';

import '../../data/model/menu_item_model.dart';
import '../../data/services/cloud_store_helper.dart';
import 'cache_controller.dart';

class WishListController extends GetxController {
  bool _gettingList = false;

  List<MenuItemModel> _wishlist = [];

  bool get gettingList => _gettingList;

  List<MenuItemModel> get wishlist => _wishlist;

  Future<bool> addToWishList(MenuItemModel item) async {
    final response = await CloudStorageHelper()
        .addToWishList(Get.find<CacheController>().userId!, item);

    if (response.isSuccessful) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getWishlist() async {
    _gettingList = true;
    update();
    final response = await CloudStorageHelper()
        .getWishlist(Get.find<CacheController>().userId!);
    _gettingList = false;
    if (response.isSuccessful) {
      _wishlist = response.returnData;
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
