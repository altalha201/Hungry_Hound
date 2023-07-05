import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/review_controller.dart';
import '../../widget/card_widgets/review_card.dart';
import '../../widget/loading_widget.dart';
import '../create_review_screen.dart';

class ReviewsTab extends StatefulWidget {
  const ReviewsTab({Key? key, required this.restaurantID}) : super(key: key);
  final String restaurantID;

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<ReviewController>(
            builder: (controller) {
              if (controller.gettingReviews) {
                return const LoadingWidget();
              }
              return ListView.builder(
                itemCount: controller.reviews.length,
                itemBuilder: (context, index) {
                  return ReviewCard(
                    model: controller.reviews.elementAt(index),
                  );
                },
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateReviewScreen(restaurantID: widget.restaurantID,));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
