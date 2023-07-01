class OrderModel {
  String? orderId;
  String? userId;
  String? restaurantId;
  String? itemId;
  String? itemName;
  int? itemQuantity;
  String? userAddress;
  String? orderStatus;
  String? orderTime;

  OrderModel(
      {this.orderId,
        this.userId,
        this.restaurantId,
        this.itemId,
        this.itemName,
        this.itemQuantity,
        this.userAddress,
        this.orderStatus,
        this.orderTime});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemQuantity = json['item_quantity'];
    userAddress = json['user_address'];
    orderStatus = json['order_status'];
    orderTime = json['order_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['user_id'] = userId;
    data['restaurant_id'] = restaurantId;
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_quantity'] = itemQuantity;
    data['user_address'] = userAddress;
    data['order_status'] = orderStatus;
    data['order_time'] = orderTime;
    return data;
  }
}
