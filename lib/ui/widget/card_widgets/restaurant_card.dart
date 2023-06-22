import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungry_hound/ui/screens/restaurent_screen.dart';

import '../../utils/application_colors.dart';
import '../../utils/other_utils.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const RestaurantScreen());
      },
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      child: Column(
        children: [
          Ink(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(restaurantTheme),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: const [
              Text(
                "Restaurant Name",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Icon(
                Icons.star,
                color: Colors.amberAccent,
                size: 16,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text("4.0"),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: const [
              Icon(
                Icons.location_on,
                size: 18.0,
                color: colorPrimaryBlack,
              ),
              SizedBox(
                width: 16.0,
              ),
              Text("Location")
            ],
          ),
          const SizedBox(height: 16.0,)
        ],
      ),
    );
  }
}
