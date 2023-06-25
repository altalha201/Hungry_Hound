import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/customer_model.dart';
import '../../controller/cache_controller.dart';
import '../../utils/application_colors.dart';
import '../../utils/util_functions.dart';

class CustomerMenu extends StatelessWidget {
  const CustomerMenu({
    Key? key,
    required this.customer,
  }) : super(key: key);

  final CustomerModel customer;

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
            const ListTile(
              leading: Icon(Icons.list),
              title: Text("My Orders"),
            ),
            const ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text("My cart"),
            ),
            const ListTile(
              leading: Icon(Icons.favorite_border_outlined),
              title: Text("My wishlist"),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            const ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text("Address"),
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
