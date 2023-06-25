class CustomerModel {
  String? userName;
  String? userId;
  String? address;
  String? img;

  CustomerModel({this.userName, this.userId, this.address, this.img});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userId = json['user_id'];
    address = json['address'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['user_id'] = userId;
    data['address'] = address;
    data['img'] = img;
    return data;
  }
}
