class MenuItemModel {
  String? itemId;
  String? restaurantId;
  String? itemName;
  String? itemImg;
  int? itemQuantity;
  double? itemPrice;
  double? itemStar;
  String? itemDescription;

  MenuItemModel({
    this.itemId,
    this.restaurantId,
    this.itemName,
    this.itemImg,
    this.itemQuantity,
    this.itemPrice,
    this.itemStar,
    this.itemDescription,
  });

  MenuItemModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    restaurantId = json['restaurant_id'];
    itemName = json['item_name'];
    itemImg = json['item_img'];
    itemQuantity = json['item_quantity'];
    itemPrice = json['item_price'];
    itemStar = json['item_star'];
    itemDescription = json['item_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['restaurant_id'] = restaurantId;
    data['item_name'] = itemName;
    data['item_img'] = itemImg;
    data['item_quantity'] = itemQuantity;
    data['item_price'] = itemPrice;
    data['item_star'] = itemStar;
    data['item_description'] = itemDescription;
    return data;
  }
}
