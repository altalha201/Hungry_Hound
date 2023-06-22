import 'package:flutter/material.dart';

import '../widget/card_widgets/restaurant_card.dart';
import '../widget/drawer_menus/base_manu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hungry Hound"),
      ),
      drawer: const BaseManu(),
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