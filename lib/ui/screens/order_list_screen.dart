import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/order_list_change_controller.dart';
import '../utils/application_colors.dart';
import '../widget/app_bars/logo_app_bar.dart';
import '../widget/card_widgets/owner_order_card.dart';
import '../widget/loading_widget.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({
    Key? key,
    this.fromCompleted,
    required this.restaurantID,
  }) : super(key: key);

  final bool? fromCompleted;
  final String restaurantID;

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      if (widget.fromCompleted ?? false) {
        await Get.find<OrderListChangeController>()
            .getList("completed", widget.restaurantID);
      } else {
        await Get.find<OrderListChangeController>()
            .getList("ongoing", widget.restaurantID);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              (widget.fromCompleted ?? false)
                  ? "Completed Orders"
                  : "Ongoing Orders",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colorPrimaryBlack),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child:
                  GetBuilder<OrderListChangeController>(builder: (controller) {
                if (controller.gettingList) {
                  return const LoadingWidget();
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    if (widget.fromCompleted ?? false) {
                      await Get.find<OrderListChangeController>()
                          .getList("completed", widget.restaurantID);
                    } else {
                      await Get.find<OrderListChangeController>()
                          .getList("ongoing", widget.restaurantID);
                    }
                  },
                  child: ListView.builder(
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      return OwnerOrderCard(
                        model: controller.list.elementAt(index),
                      );
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
