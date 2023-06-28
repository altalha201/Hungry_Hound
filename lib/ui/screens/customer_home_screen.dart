import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/get_user_controller.dart';
import '../controller/restaurant_list_controller.dart';
import '../widget/app_bars/customer_app_bar.dart';
import '../widget/card_widgets/restaurant_card.dart';
import '../widget/drawer_menus/customer_menu.dart';
import '../widget/loading_widget.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      await Get.find<GetUserController>().getCustomer();
      await Get.find<RestaurantListController>().getRestaurantList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customerAppBar(),
      drawer: GetBuilder<GetUserController>(builder: (userController) {
        if (userController.gettingUser) {
          return const LoadingWidget();
        }
        return CustomerMenu(
          customer: userController.customer,
          fromHome: true,
        );
      }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<RestaurantListController>(builder: (listController) {
          if (listController.gettingRestaurants) {
            return const LoadingWidget();
          }
          return SingleChildScrollView(
            child: Column(
              children: listController.restaurants
                  .map((restaurant) => RestaurantCard(restaurant: restaurant,))
                  .toList(),
            ),
          );
        }),
      ),
    );
  }
}
