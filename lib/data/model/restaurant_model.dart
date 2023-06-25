class RestaurantModel {
  String? restaurantName;
  String? restaurantId;
  String? img;
  String? location;

  RestaurantModel({
    this.restaurantName,
    this.restaurantId,
    this.img,
    this.location,
  });

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    restaurantName = json['restaurant_name'];
    restaurantId = json['restaurant_id'];
    img = json['img'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant_name'] = restaurantName;
    data['restaurant_id'] = restaurantId;
    data['img'] = img;
    data['location'] = location;
    return data;
  }
}
