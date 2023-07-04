import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/menu_item_controller.dart';
import '../../widget/card_widgets/menu_item_card.dart';
import '../../widget/loading_widget.dart';
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
        child: GetBuilder<MenuItemController>(builder: (controller) {
          if (controller.gettingItems) {
            return const LoadingWidget();
          }
          return SingleChildScrollView(
            child: Column(
                children: controller.menuItems
                    .map((item) => MenuItemCard(
                          fromOwner: true,
                          item: item,
                        ))
                    .toList()),
          );
        }),
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
