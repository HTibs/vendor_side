import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../models/order.dart';
import '../models/detailsActivityCartItem.dart';
import '../services/connections.dart' as connection;
import '../widgets/orderStatusWidgetBuilder.dart';
import '../models/cartItem.dart';
import '../models/item.dart';

class OrdersScopedModel extends Model {
  static List<Order> allOrdersList = [];
  //static List<DetailsActivityCartItem> allDetailedCartItemsList = [];

  // this is the function to get all the orders
  Future<List<Order>> getAllOrdersListFuture() async {
    http.Response result = await http.get(connection.orderUrl);
    var parsed = json.decode(result.body).cast<Map<String, dynamic>>();
    allOrdersList = parsed.map<Order>((json) => Order.fromJson(json)).toList();
    return allOrdersList;
  }

  Widget allOrdersFutureBuilder(BuildContext context) {
    return FutureBuilder<List<Order>>(
      future: getAllOrdersListFuture(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? allOrdersListBuilder(snapshot.data)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget allOrdersListBuilder(List<Order> all) {
    return ListView.builder(
        itemCount: all.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white),
              height: 100.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          // container for text
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Restaurant ${all[index].restaurantId}',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Text(
                                all[index].orderId,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      OrderStatusWidgetBuilder(all[index].status),
                    ],
                  ),
                  Container(
                    width: 100.0,
                    height: 30.0,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Details',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        // open details of the order
                        // call funtion of order details while passing the order id to it
                        // getOrderDetails(String orderID);
                        Navigator.pushNamed(context, '/orderDetails',
                            arguments: index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
          ;
        });
  }

  Future<DetailsActivityCartItem> createDetailsActivityCartItem(
      CartItem recievedCartItem) async {
    DetailsActivityCartItem temp;

    Item _item = await Item().getSingleItemFuture(recievedCartItem.itemId);
    temp.itemName = recievedCartItem.itemName;
    temp.itemId = recievedCartItem.itemId;
    temp.requestedQty = recievedCartItem.requestedQty;
    temp.currentSell = recievedCartItem.pricePerUnit;
    temp.currentCost = _item.costPrice;
    temp.currentStock = _item.stock;
    temp.newSell = _item.sellPrice;
    temp.margin = _item.code;
    temp.fulfilledQty = recievedCartItem.requestedQty;
    print(temp.currentStock);

    return temp;
  }
}
