import 'package:flutter/material.dart';
import 'package:hungry_hound/ui/utils/application_colors.dart';
import 'package:hungry_hound/ui/widget/item_stepper.dart';

import '../utils/other_utils.dart';

class FoodItemDetailsScreen extends StatefulWidget {
  const FoodItemDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FoodItemDetailsScreen> createState() => _FoodItemDetailsScreenState();
}

class _FoodItemDetailsScreenState extends State<FoodItemDetailsScreen> {
  final double _itemPrice = 100.0;
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(foodTheme),
              fit: BoxFit.cover,
              opacity: 0.6,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.lighten),
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 56.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Center(
                    child: BackButton(
                      color: colorPrimaryBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 52,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16.0,
                            ),
                            const Text(
                              "Food Item Name",
                              style: TextStyle(
                                  color: colorPrimaryBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_border_outlined,
                                  color: Colors.amberAccent,
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                const Text(
                                  "4.5",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.favorite_border_outlined),
                                  splashColor: colorPrimaryBlack,
                                  splashRadius: 18,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Price: ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: colorPrimaryBlack,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "$_itemPrice /=",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: colorPrimaryGreen,
                                  ),
                                ),
                                const Spacer(),
                                ItemStepper(
                                  onValueChange: (int currentValue) {
                                    setState(() {
                                      _itemCount = currentValue;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            const Text(
                              "Food Description",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              textDescription,
                              style: TextStyle(color: Colors.grey.shade400),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                      decoration: BoxDecoration(
                        color: colorPrimaryGreen.withOpacity(0.4),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total Price",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "${_itemPrice * _itemCount} /=",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Add to Cart"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}