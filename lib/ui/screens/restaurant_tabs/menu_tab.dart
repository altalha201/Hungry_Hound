import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/menu_item_controller.dart';
import '../../widget/card_widgets/menu_item_card.dart';
import '../../widget/loading_widget.dart';

class MenuTab extends StatefulWidget {
  const MenuTab({Key? key}) : super(key: key);

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<MenuItemController>(builder: (controller) {
        if (controller.gettingItems) {
          return const LoadingWidget();
        }
        return SingleChildScrollView(
          child: Column(
            children:
                controller.menuItems.map((item) => MenuItemCard(item: item,)).toList(),
          ),
        );
      }),
    );
  }
}
