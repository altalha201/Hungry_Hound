import 'package:flutter/material.dart';
import 'package:hungry_hound/ui/screens/owner_tabs/menu_tab.dart';
import 'package:hungry_hound/ui/screens/owner_tabs/order_tab.dart';
import 'package:hungry_hound/ui/utils/other_utils.dart';

import '../utils/application_colors.dart';
import '../widget/app_bars/logo_app_bar.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: Column(
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
                        image: const DecorationImage(
                            image: NetworkImage(restaurantTheme),
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
                              const Text(
                                "Restaurant Name",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: colorPrimaryBlack),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "Restaurant Address",
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
                      TextButton(onPressed: () {}, child: const Text("Logout"))
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(child: bodyItem[_selected]),
        ],
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
