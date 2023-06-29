import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/get_user_controller.dart';
import '../widget/app_bars/customer_app_bar.dart';
import '../widget/card_widgets/cart_item_card.dart';
import '../widget/card_widgets/total_price_card.dart';
import '../widget/drawer_menus/customer_menu.dart';
import '../widget/loading_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double _totalPrice = 0;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      await Get.find<CartController>().getCartList();
      for (var item in Get.find<CartController>().cartList) {
        _totalPrice += ((item.itemQuantity ?? 1) * (item.itemPrice ?? 1));
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customerAppBar(fromCart: true),
      drawer: CustomerMenu(
        customer: Get.find<GetUserController>().customer,
        fromCart: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GetBuilder<CartController>(
                  builder: (controller) {
                    if (controller.gettingCartList) {
                      return const LoadingWidget();
                    }
                    return ListView.builder(
                        itemCount: controller.cartList.length,
                        itemBuilder: (context, index) {
                          return CartItemCard(
                              item: controller.cartList.elementAt(index));
                        });
                  },
                )),
          ),
          TotalPriceCard(
            totalPrice: _totalPrice,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Order Now"),
            ),
          ),
        ],
      ),
    );
  }
}
