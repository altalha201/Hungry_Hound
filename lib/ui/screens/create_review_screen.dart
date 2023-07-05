import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../data/model/review_model.dart';
import '../controller/get_user_controller.dart';
import '../controller/review_controller.dart';
import '../widget/app_bars/logo_app_bar.dart';
import '../widget/loading_widget.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({Key? key, required this.restaurantID})
      : super(key: key);

  final String restaurantID;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  int rating = 3;

  final TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Give a rating under 5 star"),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: RatingBar.builder(
                      initialRating: 3,
                      itemBuilder: (context, _) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 56,
                        );
                      },
                      itemPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      onRatingUpdate: (value) {
                        setState(() {
                          rating = value.toInt();
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text("Write a review about us"),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: _description,
                maxLines: 5,
                decoration: const InputDecoration(hintText: "Your opinion"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: GetBuilder<ReviewController>(builder: (controller) {
                  if (controller.creatingReview) {
                    return const LoadingWidget();
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      await controller.createReview(
                        ReviewModel(
                          reviewId:
                              Get.find<GetUserController>().customer.userId,
                          userName:
                              Get.find<GetUserController>().customer.userName,
                          reviewDescription: _description.text,
                          star: rating,
                          restaurantId: widget.restaurantID,
                        ),
                      );
                      Get.back();
                    },
                    child: const Text("Submit"),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
