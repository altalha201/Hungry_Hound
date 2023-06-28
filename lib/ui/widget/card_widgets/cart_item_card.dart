import 'package:flutter/material.dart';

import '../../../data/model/cart_item_model.dart';
import '../../utils/application_colors.dart';
import '../../utils/util_functions.dart';
import '../item_stepper.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key, required this.item,
  }) : super(key: key);

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        shadowColor: colorPrimaryGreen.withOpacity(0.2),
        child: Row(
          children: [
            Ink(
              height: 140,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: MemoryImage(getBase64Image(item.itemImg ?? "")),
                  fit: BoxFit.cover
                )
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.itemName ?? "Unknown",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: colorPrimaryBlack,
                                ),
                              ),
                              const SizedBox(height: 4.0,),
                              Text(
                                "Price / item: \$ ${item.itemPrice ?? 0}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outline_outlined,
                              color: Colors.red,
                            ))
                      ],
                    ),
                    // verticalSpace(8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "\$ ${/*item.product?.price ??*/ 0}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: colorPrimaryGreen,
                          ),
                        ),
                        const Spacer(),
                        ItemStepper(onValueChange: (int currentValue) {  },)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}