class ReviewModel {
  String? reviewId;
  String? userName;
  String? reviewDescription;
  int? star;
  String? restaurantId;

  ReviewModel(
      {this.reviewId,
        this.userName,
        this.reviewDescription,
        this.star,
        this.restaurantId});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    userName = json['user_name'];
    reviewDescription = json['review_description'];
    star = json['star'];
    restaurantId = json['restaurant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review_id'] = reviewId;
    data['user_name'] = userName;
    data['review_description'] = reviewDescription;
    data['star'] = star;
    data['restaurant_id'] = restaurantId;
    return data;
  }
}
