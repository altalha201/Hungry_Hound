import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungry_hound/ui/controller/order_controller.dart';
import 'package:hungry_hound/ui/widget/loading_widget.dart';

import '../controller/get_user_controller.dart';
import '../widget/app_bars/customer_app_bar.dart';
import '../widget/card_widgets/customer_order_card.dart';
import '../widget/drawer_menus/customer_menu.dart';

class CustomerOrderScreen extends StatefulWidget {
  const CustomerOrderScreen({Key? key}) : super(key: key);

  @override
  State<CustomerOrderScreen> createState() => _CustomerOrderScreenState();
}

class _CustomerOrderScreenState extends State<CustomerOrderScreen> {

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) async {
      await Get.find<OrderController>().getCustomerOrderList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customerAppBar(),
      drawer: CustomerMenu(
        customer: Get.find<GetUserController>().customer,
        fromOrder: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<OrderController>(
          builder: (controller) {
            if (controller.gettingList) {
              return const LoadingWidget();
            }

            return RefreshIndicator(
              onRefresh: () async {
                await Get.find<OrderController>().getCustomerOrderList();
              },
              child: ListView.builder(
                itemCount: controller.orderList.length,
                itemBuilder: (context, index) {
                  return CustomerOrderCard(order: controller.orderList.elementAt(index));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
