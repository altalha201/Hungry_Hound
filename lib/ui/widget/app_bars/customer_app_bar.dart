import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/cart_screen.dart';
import '../../screens/wishlist_screen.dart';
import '../text_logo.dart';

AppBar customerAppBar({bool? fromWishlist, bool? fromCart}) {
  return AppBar(
    title: const TextLogo(),
    actions: [
      Visibility(
        visible: !(fromWishlist ?? false),
        child: IconButton(
          onPressed: () {
            Get.to(const WishlistScreen());
          },
          icon: const Icon(Icons.favorite_border_outlined),
        ),
      ),
      Visibility(
        visible: !(fromCart ?? false),
        child: IconButton(
          onPressed: () {
            Get.to(const CartScreen());
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
      ),
    ],
  );
}