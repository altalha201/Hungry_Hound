import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/get_user_controller.dart';
import '../widget/card_widgets/restaurant_card.dart';
import '../widget/drawer_menus/customer_menu.dart';
import '../widget/loading_widget.dart';
import '../widget/text_logo.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) async {
      await Get.find<GetUserController>().getCustomer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextLogo(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      drawer: GetBuilder<GetUserController>(
        builder: (userController) {
          if (userController.gettingUser) {
            return const LoadingWidget();
          }
          return CustomerMenu(customer: userController.customer,);
        }
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              RestaurantCard(),
              RestaurantCard(),
              RestaurantCard(),
              RestaurantCard(),
            ],
          ),
        ),
      ),
    );
  }
}