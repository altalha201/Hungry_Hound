import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/order_model.dart';
import '../../screens/order_details_screen.dart';

class CustomerOrderCard extends StatelessWidget {
  const CustomerOrderCard({
    Key? key, required this.order,
  }) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(OrderDetailsScreen(model: order));
      },
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 80,
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(order.itemName ?? "", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                        const SizedBox(height: 4,),
                        Text(order.orderStatus ?? "", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200, fontStyle: FontStyle.italic),),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 32,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
