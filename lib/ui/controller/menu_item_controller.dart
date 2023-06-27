import 'package:get/get.dart';

import '../../data/model/menu_item_model.dart';
import '../../data/services/cloud_store_helper.dart';

class MenuItemController extends GetxController {
  bool _creatingItem = false, _gettingItems = false;

  List<MenuItemModel> _menuItems = [];

  bool get creatingItem => _creatingItem;

  bool get gettingItems => _gettingItems;

  List<MenuItemModel> get menuItems => _menuItems;

  Future<bool> createMenuItem(MenuItemModel item) async {
    _creatingItem = true;
    update();
    final response = await CloudStorageHelper().createItem(item);
    _creatingItem = false;
    if (response.isSuccessful) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getItems(String restaurantID) async {
    _gettingItems = true;
    update();
    final response = await CloudStorageHelper()
        .getMenuItemByRestaurantID(restaurantID);
    _gettingItems = false;
    if (response.isSuccessful) {
      _menuItems = response.returnData;
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
