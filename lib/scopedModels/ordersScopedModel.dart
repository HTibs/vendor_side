import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import '../models/detailsActivityCartItem.dart';

class OrdersScopedModel extends Model {
  static List<Order> allOrdersList = [];

  static BuildContext get context => null;
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

  static Widget detailsItemsListBuilder(int index) {
    List<DetailsActivityCartItem> detailedItems = [];
    Item item = Item();

    Future<List<DetailsActivityCartItem>>
        getallDetailedItemsListFuture() async {
      // add a looping statement for traversal of cartitems list
      Future<Item> getSingleItemFuture(String code) async {
        String newurl;
        newurl = connection.itemsSearchUrl + code;
        http.Response result = await http.get(newurl);
        var parsed = json.decode(result.body);
        Item nitem = new Item.fromJson(parsed[0]);
        print(nitem.toString());
        return nitem;
      }

      DetailsActivityCartItem value = DetailsActivityCartItem();
      for (int i = 0; i < allOrdersList[index].cartItems.length; i++) {
        print('value of i = $i');
        item =
            await getSingleItemFuture(allOrdersList[index].cartItems[i].itemId);
        print(item.toString() + "sdsdss");

        value.itemId = item.code;
        value.itemName = item.name;
        value.requestedQty = allOrdersList[index].cartItems[i].requestedQty;
        value.currentSell = allOrdersList[index].cartItems[i].pricePerUnit;
        value.currentCost = item.costPrice;
        value.currentStock = item.stock;
        value.newSell = item.sellPrice;
        value.margin = item.code;
        value.fulfilledQty = allOrdersList[index].cartItems[i].requestedQty;
        detailedItems.insert(i, value);
        print('hiiii');
        print(detailedItems[i].itemName);
      }

      return detailedItems;
    }

    Widget formField() {
      TextEditingController fulfillmentQtyController =
          new TextEditingController();
      return Container(
        height: 20.0,
        width: 75.0,
        child: TextFormField(
          // opening stick
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17.5),
          cursorColor: Colors.green,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 5.0, left: 5.0),
            hintText: '000',
            hintStyle: TextStyle(
                color: Colors.grey, backgroundColor: Colors.transparent),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none),
            fillColor: Colors.white,
          ),
          onSaved: (String value) {
            fulfillmentQtyController.toString();
          },
          validator: (String value) {
            if (fulfillmentQtyController.text.isEmpty) {
              return 'Required';
            } else {
              // also check for double value existing name in database
              // we return null when validation succeeds i.e no error in validation
              return null;
            }
          },
        ),
      );
    }

    Widget allDetailItemsListBuilder(List<DetailsActivityCartItem> all) {
      print(all[1].itemName);
      return ListView.builder(
          itemCount: all.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              width: MediaQuery.of(context).size.width,
              //color: Colors.white,
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 75.0,
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          all[index].itemName,
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Requested Qty:  ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15.0),
                            ),
                            Text(
                              '${all[index].requestedQty} Kgs',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text('Rs. ${all[index].currentCost}'),
                                Text(
                                  'Current Cost',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10.0),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('Rs. ${all[index].currentSell}'),
                                Text(
                                  'Current Sell',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10.0),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('${all[index].currentStock}'),
                                Text(
                                  'Current Stock',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Container(
                    width: 100.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          color: Colors.blueGrey[50],
                          child: Column(
                            children: <Widget>[
                              formField(),
                              Text('Fulfillment Qty',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.grey)),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.blueGrey[50],
                          child: Column(
                            children: <Widget>[
                              formField(),
                              Text(
                                'Sell Price',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Margin:  ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10.0),
                            ),
                            Text(
                              '00%',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 10.0),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    }

    return FutureBuilder<List<DetailsActivityCartItem>>(
      future: getallDetailedItemsListFuture(),
      builder: (context, snapshot) {
        return allDetailItemsListBuilder(detailedItems);
      },
    );
  }
}
