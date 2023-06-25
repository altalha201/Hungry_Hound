import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cache_controller.dart';
import '../../utils/application_colors.dart';

class RestaurantOwnerMenu extends StatelessWidget {
  const RestaurantOwnerMenu({
    Key? key, required this.restaurantID,
  }) : super(key: key);

  final String restaurantID;

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
              padding: const EdgeInsets.all(16.0),
              margin: EdgeInsets.zero,
              child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 80,
                      ),
                      const Text(
                        "Welcome to Hungry Hound",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.playlist_add_check_sharp),
              title: const Text("Completed Order"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.timelapse),
              title: const Text("Ongoing Order"),
            ),
            ListTile(
              onTap: () {
                Get.find<CacheController>().logout();
              },
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
            ),
            Text(restaurantID),
          ],
        ),
      ),
    );
  }
}