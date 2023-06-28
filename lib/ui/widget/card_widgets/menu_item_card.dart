import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/cart_item_model.dart';
import '../../../data/model/menu_item_model.dart';
import '../../controller/cache_controller.dart';
import '../../controller/cart_controller.dart';
import '../../screens/auth_screens/login_screen.dart';
import '../../screens/food_item_details_screen.dart';
import '../../utils/application_colors.dart';
import '../../utils/util_functions.dart';
import '../loading_widget.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    Key? key, this.fromOwner, this.item,
  }) : super(key: key);

  final bool? fromOwner;
  final MenuItemModel? item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(FoodItemDetailsScreen(item: item!, fromOwner: fromOwner,));
      },
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 140,
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item?.itemName ?? "Food Item",
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18,),
                        ),
                        Text(
                          "${item?.itemQuantity ?? 1} Pcs.",
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 14,
                              color: Colors.grey.shade500),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "${item?.itemPrice ?? 0.0} Tk.",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12.0,)
                      ],
                    ),
                  ),
                  Positioned(
                    right: 12.0,
                    child: Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: MemoryImage(getBase64Image(item?.itemImg ?? "")),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: !(fromOwner ?? false),
                          child: GetBuilder<CartController>(
                            builder: (controller) {
                              return InkWell(
                                onTap: () {
                                  if (Get.find<CacheController>().isLogin()) {
                                    final cartItem = CartItemModel(
                                      customerId: Get.find<CacheController>().userId,
                                        restaurantId: item!.restaurantId,
                                        itemId: item!.itemId,
                                        itemName: item!.itemName,
                                        itemImg: item!.itemImg,
                                        itemPrice: item!.itemPrice,
                                        itemQuantity: 1,
                                    );
                                    controller.addToCart(cartItem).then((value) {
                                      if (value) {
                                        Get.showSnackbar(const GetSnackBar(
                                          title: "Success",
                                          message: "Item added to cart",
                                          duration: Duration(seconds: 3),
                                        ));
                                      } else {
                                        Get.showSnackbar(const GetSnackBar(
                                          title: "Failed",
                                          message: "Item add failed",
                                          duration: Duration(seconds: 3),
                                        ));
                                      }
                                    });
                                  } else {
                                    Get.showSnackbar(const GetSnackBar(
                                      title: "Login",
                                      message:
                                      "First login to create a cart",
                                      duration: Duration(seconds: 3),
                                    ));
                                    Get.to(LoginScreen());
                                  }
                                },
                                borderRadius: BorderRadius.circular(30),
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Visibility(
                                    visible: !controller.addingToCart,
                                    replacement: const LoadingWidget(),
                                    child: Card(
                                      color: colorPrimaryGreen,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.add, color: Colors.white, size: 18,),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                        const SizedBox(width: double.infinity, height: 8.0,),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
