import 'package:flutter/material.dart';

import '../../widget/card_widgets/menu_item_card.dart';

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
      child: Column(
        children: const [
          MenuItemCard(),
          MenuItemCard(),
          MenuItemCard(),
        ],
      ),
    );
  }
}
