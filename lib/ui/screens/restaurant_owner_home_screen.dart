import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cache_controller.dart';
import '../controller/get_user_controller.dart';
import '../controller/menu_item_controller.dart';
import '../utils/application_colors.dart';
import '../utils/util_functions.dart';
import '../widget/drawer_menus/restaurant_owner_menu.dart';
import '../widget/loading_widget.dart';
import '../widget/text_logo.dart';
import 'owner_tabs/menu_tab.dart';
import 'owner_tabs/order_tab.dart';

class RestaurantOwnerHomeScreen extends StatefulWidget {
  const RestaurantOwnerHomeScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantOwnerHomeScreen> createState() =>
      _RestaurantOwnerHomeScreenState();
}

class _RestaurantOwnerHomeScreenState extends State<RestaurantOwnerHomeScreen> {
  List<Widget> bodyItem = [
    const OrderTab(),
    const MenuTab(),
  ];

  int _selected = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      await Get.find<GetUserController>().getRestaurant();
      await Get.find<MenuItemController>().getItems(Get.find<CacheController>().userId!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(Get.find<CacheController>().userId.toString());
    return Scaffold(
      key: _scaffoldKey,
      body: GetBuilder<GetUserController>(builder: (userController) {
        if (userController.gettingUser) {
          return const LoadingWidget();
        }
        return Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(
                          getBase64Image(userController.restaurant.img ?? "")),
                      fit: BoxFit.cover,
                      opacity: 0.6,
                      colorFilter: const ColorFilter.mode(
                          Colors.black, BlendMode.lighten),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppBar().preferredSize.height,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(35),
                              topLeft: Radius.circular(35),
                            ),
                          ),
                          elevation: 3.0,
                          shadowColor: colorPrimaryGreen.withOpacity(0.2),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                  ),
                                  onPressed: () {
                                    _scaffoldKey.currentState!.openDrawer();
                                  },
                                ),
                              ),
                              const TextLogo()
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userController.restaurant.restaurantName ??
                                      "",
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 18.0,
                                      color: colorPrimaryBlack,
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Text(userController.restaurant.location ??
                                        "")
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit_outlined),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: bodyItem.elementAt(_selected)),
                    ],
                  ),
                )
              ],
            )
          ],
        );
      }),
      drawer: RestaurantOwnerMenu(
        restaurantID: Get.find<CacheController>().userId ?? "",
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(45),
          topLeft: Radius.circular(45),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selected = index;
            });
          },
          backgroundColor: Colors.grey.shade200,
          elevation: 5.0,
          currentIndex: _selected,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Orders",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded), label: "Menu"),
          ],
        ),
      ),
    );
  }
}
