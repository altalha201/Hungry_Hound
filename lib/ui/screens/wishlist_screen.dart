import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/get_user_controller.dart';
import '../controller/wish_list_controller.dart';
import '../widget/app_bars/customer_app_bar.dart';
import '../widget/card_widgets/menu_item_card.dart';
import '../widget/drawer_menus/customer_menu.dart';
import '../widget/loading_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Get.find<WishListController>().getWishlist();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customerAppBar(
        fromWishlist: true,
      ),
      drawer: CustomerMenu(
        customer: Get.find<GetUserController>().customer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<WishListController>(
          builder: (controller) {
            if (controller.gettingList) {
              return const LoadingWidget();
            }
            return SingleChildScrollView(
              child: Column(
                children: controller.wishlist
                    .map((item) => MenuItemCard(item: item))
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
