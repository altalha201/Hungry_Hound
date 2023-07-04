import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/restaurant_list_controller.dart';
import '../widget/card_widgets/restaurant_card.dart';
import '../widget/drawer_menus/base_manu.dart';
import '../widget/loading_widget.dart';
import '../widget/text_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      await Get.find<RestaurantListController>().getRestaurantList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextLogo(),
      ),
      drawer: const BaseManu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<RestaurantListController>(builder: (listController) {
          if (listController.gettingRestaurants) {
            return const LoadingWidget();
          }

          return SingleChildScrollView(
            child: Column(
              children: listController.restaurants
                  .map((restaurant) => RestaurantCard(restaurant: restaurant))
                  .toList(),
            ),
          );
        }),
      ),
    );
  }
}
