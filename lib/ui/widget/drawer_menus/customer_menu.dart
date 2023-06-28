import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/customer_model.dart';
import '../../controller/cache_controller.dart';
import '../../screens/cart_screen.dart';
import '../../screens/customer_home_screen.dart';
import '../../screens/wishlist_screen.dart';
import '../../utils/application_colors.dart';
import '../../utils/util_functions.dart';

class CustomerMenu extends StatelessWidget {
  const CustomerMenu({
    Key? key,
    required this.customer, this.fromHome, this.fromWishlist, this.fromCart,
  }) : super(key: key);

  final CustomerModel customer;
  final bool? fromHome, fromWishlist, fromCart;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: colorPrimaryGreen, width: 1.0),
                ),
              ),
              padding: const EdgeInsets.all(24.0),
              margin: EdgeInsets.zero,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          MemoryImage(getBase64Image(customer.img ?? "")),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      customer.userName ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !(fromHome ?? false),
              child: ListTile(
                onTap: () {
                  Get.to(const CustomerHomeScreen());
                },
                leading: const Icon(Icons.home_outlined),
                title: const Text("Home"),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.list),
              title: Text("My Orders"),
            ),
            Visibility(
              visible: !(fromCart ?? false),
              child: ListTile(
                onTap: () {
                  Get.to(const CartScreen());
                },
                leading: const Icon(Icons.shopping_bag_outlined),
                title: const Text("My cart"),
              ),
            ),
            Visibility(
              visible: !(fromWishlist ?? false),
              child: ListTile(
                onTap: () {
                  Get.to(const WishlistScreen());
                },
                leading: const Icon(Icons.favorite_border_outlined),
                title: const Text("My wishlist"),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              onTap: () {
                Get.find<CacheController>().logout();
              },
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
