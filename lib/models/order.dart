import 'dart:convert';

import '../models/cartItem.dart';

class Order {
  String orderId;
  String restaurantId;
  String dateTime;
  String status;
  List<CartItem> cartItems;
  String total;

  Order(
      {this.orderId,
      this.restaurantId,
      this.dateTime,
      this.status,
      this.cartItems,
      this.total});

  factory Order.fromJson(Map<String, dynamic> json) {
    var list = json['cartItems'] as List;
    print(list.runtimeType);
    List<CartItem> cartItemsLisst =
        list.map((i) => CartItem.fromJson(i)).toList();

    //var cartItemsFromJson = json['cartItems'];
    //List<CartItem> cartItemsLisst = new List<CartItem>.from(cartItemsFromJson);
    return Order(
        orderId: json['orderId'],
        restaurantId: json['restaurantId'],
        dateTime: json['dateTime'],
        status: json['status'],
        cartItems: cartItemsLisst,
        total: json['total']);
  }

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'restaurantId': restaurantId,
        'dateTime': dateTime,
        'status': status,
        'cartItems': cartItems,
        'total': total
      };
}
