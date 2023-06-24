import 'package:flutter/material.dart';

import '../../widget/card_widgets/owner_order_card.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({Key? key}) : super(key: key);

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          OwnerOrderCard(),
          OwnerOrderCard(),
          OwnerOrderCard(),
        ],
      ),
    );
  }
}