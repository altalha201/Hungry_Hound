class RestaurantModel {
  String? restaurantName;
  String? restaurantId;
  String? img;
  String? location;
  double? ratting;

  RestaurantModel({
    this.restaurantName,
    this.restaurantId,
    this.img,
    this.location,
    this.ratting,
  });

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    restaurantName = json['restaurant_name'];
    restaurantId = json['restaurant_id'];
    img = json['img'];
    location = json['location'];
    ratting = json['star'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant_name'] = restaurantName;
    data['restaurant_id'] = restaurantId;
    data['img'] = img;
    data['location'] = location;
    data['star'] = ratting;
    return data;
  }
}
