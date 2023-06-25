import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/restaurant_model.dart';
import '../../screens/restaurant_screen.dart';
import '../../utils/application_colors.dart';
import '../../utils/util_functions.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key, required this.restaurant,
  }) : super(key: key);

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(RestaurantScreen(restaurant: restaurant,));
      },
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      child: Column(
        children: [
          Ink(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                image: MemoryImage(getBase64Image(restaurant.img ?? "")),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Text(
                restaurant.restaurantName ?? "",
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.star,
                color: Colors.amberAccent,
                size: 16,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text("${restaurant.ratting ?? 0.0}"),
            ],
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
              Text(restaurant.location ?? "")
            ],
          ),
          const SizedBox(height: 16.0,)
        ],
      ),
    );
  }
}
