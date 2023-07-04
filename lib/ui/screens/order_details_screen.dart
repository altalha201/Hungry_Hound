import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungry_hound/ui/controller/order_controller.dart';
import 'package:hungry_hound/ui/controller/order_status_controller.dart';
import 'package:hungry_hound/ui/utils/application_colors.dart';

import '../../data/model/order_model.dart';
import '../widget/app_bars/logo_app_bar.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key, required this.model}) : super(key: key);

  final OrderModel model;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  double _progressValue = 0;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      switch (widget.model.orderStatus) {
        case "Pending":
          _progressValue = 0.25;
          break;
        case "Accepted":
          _progressValue = 0.50;
          break;
        case "Preparing":
          _progressValue = 0.75;
          break;
        case "Delivered":
          _progressValue = 1.0;
          break;
        default:
          _progressValue = 0.0;
          break;
      }
      log(_progressValue.toString());
      setState(() {});
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: CircularProgressIndicator(
                        value: _progressValue,
                        backgroundColor: widget.model.orderStatus == 'Cancel'
                            ? Colors.red
                            : colorPrimaryGreen.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(widget.model.orderStatus ?? ""),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 32.0,
              width: double.infinity,
            ),
            Text(
              widget.model.itemName ?? "",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "${widget.model.itemQuantity ?? 0}",
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Visibility(
                visible: widget.model.orderStatus != "Cancel",
                replacement: ElevatedButton(
                  onPressed: () async {
                    await Get.find<OrderStatusController>()
                        .deleteFromCustomerList(
                        widget.model.orderId ?? "", widget.model.userId ?? "");
                    Get.find<OrderController>().getCustomerOrderList();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Delete From List"),
                ),
                child: Visibility(
                  visible: widget.model.orderStatus != "Delivered",
                  child: ElevatedButton(
                    onPressed: () async {
                      await Get.find<OrderStatusController>().cancelOrder(
                          widget.model.orderId ?? "",
                          widget.model.userId ?? "",
                          widget.model.restaurantId ?? "");
                      Get.find<OrderController>().getCustomerOrderList();
                      Get.back();
                    },
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text("Cancel Order"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
