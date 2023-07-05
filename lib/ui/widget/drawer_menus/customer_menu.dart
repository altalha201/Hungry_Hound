import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/customer_model.dart';
import '../../controller/cache_controller.dart';
import '../../screens/cart_screen.dart';
import '../../screens/customer_home_screen.dart';
import '../../screens/customer_order_screen.dart';
import '../../screens/user_profile_screen.dart';
import '../../screens/wishlist_screen.dart';
import '../../utils/application_colors.dart';
import '../../utils/util_functions.dart';

class CustomerMenu extends StatelessWidget {
  const CustomerMenu({
    Key? key,
    required this.customer,
    this.fromHome,
    this.fromWishlist,
    this.fromCart,
    this.fromOrder, this.fromProfile,
  }) : super(key: key);

  final CustomerModel customer;
  final bool? fromHome, fromWishlist, fromCart, fromOrder, fromProfile;

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
            Visibility(
              visible: !(fromOrder ?? false),
              child: ListTile(
                leading: const Icon(Icons.list),
                title: const Text("My Orders"),
                onTap: () {
                  Get.to(const CustomerOrderScreen());
                },
              ),
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
            Visibility(
              visible: !(fromProfile ?? false),
              child: ListTile(
                onTap: () {
                  Get.to(const UserProfileScreen());
                },
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
              ),
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
