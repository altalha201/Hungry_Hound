import 'package:get/get.dart';

import '../../data/model/review_model.dart';
import '../../data/services/cloud_store_helper.dart';

class ReviewController extends GetxController {
  bool _creatingReview = false, _gettingReviews = false;
  final List<ReviewModel> _reviews = [];

  bool get creatingReview => _creatingReview;

  bool get gettingReviews => _gettingReviews;

  List<ReviewModel> get reviews => _reviews;

  Future<void> createReview(ReviewModel model) async {
    _creatingReview = true;
    update();
    await CloudStorageHelper()
        .cloudRef
        .collection("restaurant_items")
        .doc("review")
        .collection(model.restaurantId ?? "")
        .doc(model.reviewId)
        .set(model.toJson());
    await getReviews(model.restaurantId ?? "");
    int starSum = 0;
    for (var element in _reviews) {
      starSum += (element.star ?? 0);
    }
    double updatedStar = starSum / _reviews.length;
    await CloudStorageHelper()
        .cloudRef
        .collection("restaurants")
        .doc(model.restaurantId)
        .update({"star": updatedStar});
    _creatingReview = false;
    update();
  }

  Future<void> getReviews(String restaurantID) async {
    _gettingReviews = true;
    update();
    _reviews.clear();
    final ref = CloudStorageHelper()
        .cloudRef
        .collection("restaurant_items")
        .doc("review")
        .collection(restaurantID);
    await ref.get().then((documents) => {
          for (var docs in documents.docs)
            {_reviews.add(ReviewModel.fromJson(docs.data()))}
        });
    _gettingReviews = false;
    update();
  }
}
