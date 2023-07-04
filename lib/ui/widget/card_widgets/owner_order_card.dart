import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungry_hound/data/model/order_model.dart';
import 'package:hungry_hound/ui/controller/order_list_change_controller.dart';
import 'package:hungry_hound/ui/controller/order_status_controller.dart';

import '../../controller/order_controller.dart';
import '../../utils/application_colors.dart';

class OwnerOrderCard extends StatelessWidget {
  const OwnerOrderCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OrderModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {},
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.itemName ?? "",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      model.userAddress ?? "",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      model.orderStatus ?? "",
                      style: const TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: model.orderStatus == "Pending",
                child: IconButton(
                  onPressed: () async {
                    await Get.find<OrderStatusController>().cancelOrder(
                        model.orderId ?? "",
                        model.userId ?? "",
                        model.restaurantId ?? "");
                    await Get.find<OrderController>().getRestaurantOrderList();
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Visibility(
                visible: model.orderStatus == "Pending",
                child: IconButton(
                  onPressed: () async {
                    await Get.find<OrderStatusController>().updateOrderStatus(
                        model.orderId ?? "",
                        model.userId ?? "",
                        model.restaurantId ?? "",
                        "Accepted");
                    await Get.find<OrderListChangeController>().addToOnGoing(
                        model.orderId ?? "", model.restaurantId ?? "");
                    await Get.find<OrderController>().getRestaurantOrderList();
                  },
                  icon: const Icon(
                    Icons.check,
                    color: colorPrimaryGreen,
                  ),
                ),
              ),
              Visibility(
                visible: model.orderStatus != "Delivered",
                replacement: const Icon(Icons.done, size: 32,),
                child: Visibility(
                  visible: model.orderStatus != "Pending",
                  child: IconButton(
                    onPressed: () async {
                      late final String newStatus;
                      if (model.orderStatus == "Accepted") {
                        newStatus = "Preparing";
                      } else if (model.orderStatus == "Preparing") {
                        newStatus = "Delivered";
                      }
                      await Get.find<OrderStatusController>().updateOrderStatus(
                          model.orderId ?? "",
                          model.userId ?? "",
                          model.restaurantId ?? "",
                          newStatus);
                      if (newStatus == "Delivered") {
                        await Get.find<OrderListChangeController>()
                            .addToCompleted(
                                model.orderId ?? "", model.restaurantId ?? "");
                      }
                      await Get.find<OrderListChangeController>()
                          .getList("ongoing", model.restaurantId ?? "");
                    },
                    icon: const Icon(
                      Icons.update,
                      color: colorPrimaryGreen,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
