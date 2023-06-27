import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../data/model/menu_item_model.dart';
import '../controller/cache_controller.dart';
import '../controller/menu_item_controller.dart';
import '../utils/util_functions.dart';
import '../widget/app_bars/logo_app_bar.dart';
import '../widget/button_widgets/image_selecting_button.dart';
import '../widget/loading_widget.dart';
import 'restaurant_owner_home_screen.dart';

class CreateMenuItemScreen extends StatefulWidget {
  const CreateMenuItemScreen({Key? key}) : super(key: key);

  @override
  State<CreateMenuItemScreen> createState() => _CreateMenuItemScreenState();
}

class _CreateMenuItemScreenState extends State<CreateMenuItemScreen> {

  final TextEditingController _nameET = TextEditingController();
  final TextEditingController _quantityET = TextEditingController();
  final TextEditingController _priceET = TextEditingController();
  final TextEditingController _descriptionET = TextEditingController();

  final GlobalKey<FormState> _itemKey = GlobalKey<FormState>();

  File? pickedImage;
  String? base64Img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _itemKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Item Name"),
                  controller: _nameET,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Item name required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: "Quantity"),
                        controller: _quantityET,
                        validator: (value) {
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: "Price"),
                        controller: _priceET,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Price required";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                ImageSelectingButton(
                  onPicked: (File? picked) {
                    pickedImage = picked;
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  maxLines: 6,
                  decoration: const InputDecoration(hintText: "Food description"),
                  controller: _descriptionET,
                  validator: (value) {
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                GetBuilder<MenuItemController>(
                  builder: (controller) {
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Visibility(
                        visible: !controller.creatingItem,
                        replacement: const LoadingWidget(),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_itemKey.currentState!.validate()) {
                              if (pickedImage != null) {
                                base64Img = await convertToBase64String(pickedImage!);
                              }
                              late String itemCount;
                              if(_quantityET.text.isEmpty) {
                                itemCount = "1";
                              } else {
                                itemCount = _quantityET.text;
                              }
                              MenuItemModel item = MenuItemModel(
                                restaurantId: Get.find<CacheController>().userId,
                                itemId: const Uuid().v4(),
                                itemName: _nameET.text,
                                itemQuantity: int.parse(itemCount),
                                itemPrice: double.parse(_priceET.text),
                                itemStar: 0.0,
                                itemImg: base64Img,
                                itemDescription: _descriptionET.text,
                              );
                              final response = await controller.createMenuItem(item);
                              if(response) {
                                Get.off(const RestaurantOwnerHomeScreen());
                              } else {
                                Get.showSnackbar(const GetSnackBar(
                                  title: "Failed",
                                  message: "Item create failed",
                                  duration: Duration(seconds: 3),
                                ));
                              }
                            }
                          },
                          child: const Text("Create Item"),
                        ),
                      ),
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
