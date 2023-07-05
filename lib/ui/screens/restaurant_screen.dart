import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/model/restaurant_model.dart';
import '../controller/menu_item_controller.dart';
import '../controller/review_controller.dart';
import '../utils/application_colors.dart';
import '../utils/util_functions.dart';
import 'restaurant_tabs/menu_tab.dart';
import 'restaurant_tabs/reviews_tab.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key, required this.restaurant}) : super(key: key);

  final RestaurantModel restaurant;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) async {
      await Get.find<MenuItemController>().getItems(widget.restaurant.restaurantId ?? "");
      await Get.find<ReviewController>().getReviews(widget.restaurant.restaurantId ?? "");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: MemoryImage(getBase64Image(widget.restaurant.img ?? "")),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.lighten)),
            ),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.restaurant.restaurantName ?? "",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 4.0,
                ),
                Text(
                  widget.restaurant.location ?? "Location",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    labelColor: colorPrimaryBlack,
                    indicatorColor: colorPrimaryGreen,
                    tabs: [
                      Tab(
                        text: "Menu",
                      ),
                      Tab(
                        text: "Reviews",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        const MenuTab(),
                        ReviewsTab(restaurantID: widget.restaurant.restaurantId ?? "",),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
