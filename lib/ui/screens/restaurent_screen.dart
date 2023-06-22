import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hungry_hound/ui/utils/application_colors.dart';

import '../utils/other_utils.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(restaurantTheme),
                  fit: BoxFit.fill,
                  opacity: 0.6,
                  colorFilter:
                      ColorFilter.mode(Colors.black, BlendMode.lighten)),
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
              children: const [
                Text(
                  "Restaurant Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 4.0,
                ),
                Text(
                  "Location",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: const [
                  TabBar(
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
                        Icon(Icons.directions_car),
                        Icon(Icons.directions_transit),
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
