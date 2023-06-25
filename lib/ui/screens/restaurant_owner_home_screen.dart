import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cache_controller.dart';
import '../controller/get_user_controller.dart';
import '../utils/application_colors.dart';
import '../utils/util_functions.dart';
import '../widget/app_bars/logo_app_bar.dart';
import '../widget/loading_widget.dart';
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

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      await Get.find<GetUserController>().getRestaurant();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: GetBuilder<GetUserController>(builder: (userController) {
        if (userController.gettingUser) {
          return const LoadingWidget();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: colorPrimaryGreen,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Ink(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: MemoryImage(getBase64Image(userController.restaurant.img!)),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userController.restaurant.restaurantName ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: colorPrimaryBlack),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  userController.restaurant.location ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: colorPrimaryGreen,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.find<CacheController>().logout();
                            }, child: const Text("Logout"))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: bodyItem[_selected]),
          ],
        );
      }),
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
