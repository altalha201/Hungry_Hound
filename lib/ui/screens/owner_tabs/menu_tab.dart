import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/card_widgets/menu_item_card.dart';
import '../create_menu_item_screen.dart';

class MenuTab extends StatefulWidget {
  const MenuTab({Key? key}) : super(key: key);

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            MenuItemCard(
              fromOwner: true,
            ),
            MenuItemCard(
              fromOwner: true,
            ),
            MenuItemCard(
              fromOwner: true,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(const CreateMenuItemScreen());
        },
        label: const Text("Add new Item"),
      ),
    );
  }
}
