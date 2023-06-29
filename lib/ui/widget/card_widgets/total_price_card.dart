import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class TotalPriceCard extends StatelessWidget {
  const TotalPriceCard({
    Key? key,
    required this.totalPrice,
    this.fromCart, required this.child,
  }) : super(key: key);

  final double totalPrice;
  final bool? fromCart;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      decoration: BoxDecoration(
        color: colorPrimaryGreen.withOpacity(0.4),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
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
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                "$totalPrice /=",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
          child,
        ],
      ),
    );
  }
}
