class CartItemModel {
  String? customerId;
  String? restaurantId;
  String? itemId;
  String? itemName;
  String? itemImg;
  double? itemPrice;
  int? itemQuantity;

  CartItemModel({
    this.customerId,
    this.restaurantId,
    this.itemId,
    this.itemName,
    this.itemImg,
    this.itemPrice,
    this.itemQuantity,
  });

  CartItemModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    restaurantId = json['restaurant_id'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemImg = json['item_img'];
    itemPrice = json['item_price'];
    itemQuantity = json['item_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['restaurant_id'] = restaurantId;
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_img'] = itemImg;
    data['item_price'] = itemPrice;
    data['item_quantity'] = itemQuantity;
    return data;
  }
}
