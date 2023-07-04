import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/order_controller.dart';
import '../../widget/card_widgets/owner_order_card.dart';
import '../../widget/loading_widget.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({Key? key}) : super(key: key);

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      await Get.find<OrderController>().getRestaurantOrderList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<OrderController>(
          builder: (controller) {
            if (controller.gettingList) {
              return const LoadingWidget();
            }
            return RefreshIndicator(
              onRefresh: () async {
                await Get.find<OrderController>().getRestaurantOrderList();
              },
              child: ListView.builder(
                itemCount: controller.orderList.length,
                itemBuilder: (context, index) {
                  return OwnerOrderCard(
                    model: controller.orderList.elementAt(index),
                  );
                },
              ),
            );
          },
        ));
  }
}
