import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scopedModels/ordersScopedModel.dart';
import '../models/order.dart';
import '../models/detailsActivityCartItem.dart';

class OrderDetailsActivity extends StatefulWidget {
  final int orderIndex;
  OrderDetailsActivity(this.orderIndex);

  @override
  _OrderDetailsActivityState createState() => _OrderDetailsActivityState();
}

class _OrderDetailsActivityState extends State<OrderDetailsActivity> {
  TextEditingController fulfillmentQtyController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(widget.orderIndex);
    return ScopedModel<OrdersScopedModel>(
      model: OrdersScopedModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 2.0, right: 2.0),
          child: ScopedModelDescendant<OrdersScopedModel>(
            builder: (context, child, model) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Restaurant ${OrdersScopedModel.allOrdersList[widget.orderIndex].restaurantId}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Expanded(
                              child: Text(
                            'Order ${OrdersScopedModel.allOrdersList[widget.orderIndex].orderId}',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.grey),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            '${OrdersScopedModel.allOrdersList[widget.orderIndex].dateTime}',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                          )),
                          Expanded(
                              child: Text(
                            '${OrdersScopedModel.allOrdersList[widget.orderIndex].dateTime}',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                          ))
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                        height: 500.0,
                        child: OrdersScopedModel.detailsItemsListBuilder(
                            widget.orderIndex)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Total:  Rs. 000',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ),
                  Container(
                    // container for two buttons one for fulfill and
                    // one for cancel

                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Cancel'),
                        ),
                        RaisedButton(
                          child: Text('Fulfill'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

//  Widget itemListCreator(var recievedItem) {
//    DetailsActivityCartItem detaileditem = new DetailsActivityCartItem()
//        .createDetailsActivityCartItem(recievedItem);
//    print(detaileditem);
//    return Container(
//      decoration: BoxDecoration(
//        border: Border.all(color: Colors.grey, width: 0.5),
//      ),
//      width: MediaQuery.of(context).size.width,
//      //color: Colors.white,
//      height: 100.0,
//      child: Row(
//        children: <Widget>[
//          Container(
//            width: 75.0,
//          ),
//          Expanded(
//              child: Container(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                Text(
//                  detaileditem.itemName,
//                  style: TextStyle(fontSize: 20.0),
//                ),
//                Row(
//                  children: <Widget>[
//                    Text(
//                      'Requested Qty:  ',
//                      style: TextStyle(color: Colors.grey, fontSize: 15.0),
//                    ),
//                    Text(
//                      '000 Kgs',
//                      style: TextStyle(
//                          color: Colors.black,
//                          fontSize: 15.0,
//                          fontWeight: FontWeight.bold),
//                    ),
//                  ],
//                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    Column(
//                      children: <Widget>[
//                        Text('Rs. 000'),
//                        Text(
//                          'Current Cost',
//                          style: TextStyle(color: Colors.grey, fontSize: 10.0),
//                        )
//                      ],
//                    ),
//                    Column(
//                      children: <Widget>[
//                        Text('Rs. 000'),
//                        Text(
//                          'Current Sell',
//                          style: TextStyle(color: Colors.grey, fontSize: 10.0),
//                        )
//                      ],
//                    ),
//                    Column(
//                      children: <Widget>[
//                        Text('000'),
//                        Text(
//                          'Current Stock',
//                          style: TextStyle(color: Colors.grey, fontSize: 10.0),
//                        )
//                      ],
//                    ),
//                  ],
//                ),
//              ],
//            ),
//          )),
//          Container(
//            width: 100.0,
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                Container(
//                  color: Colors.blueGrey[50],
//                  child: Column(
//                    children: <Widget>[
//                      formField(),
//                      Text('Fulfillment Qty',
//                          textAlign: TextAlign.center,
//                          style: TextStyle(fontSize: 10.0, color: Colors.grey)),
//                    ],
//                  ),
//                ),
//                Container(
//                  color: Colors.blueGrey[50],
//                  child: Column(
//                    children: <Widget>[
//                      formField(),
//                      Text(
//                        'Sell Price',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(fontSize: 10.0, color: Colors.grey),
//                      ),
//                    ],
//                  ),
//                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Text(
//                      'Margin:  ',
//                      style: TextStyle(color: Colors.grey, fontSize: 10.0),
//                    ),
//                    Text(
//                      '00%',
//                      style: TextStyle(color: Colors.black, fontSize: 10.0),
//                    )
//                  ],
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget formField() {
//    return Container(
//      height: 20.0,
//      width: 75.0,
//      child: TextFormField(
//        // opening stick
//        keyboardType: TextInputType.numberWithOptions(decimal: true),
//        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
//        textAlign: TextAlign.center,
//        style: TextStyle(fontSize: 17.5),
//        cursorColor: Theme.of(context).primaryColor,
//        decoration: InputDecoration(
//          contentPadding: EdgeInsets.only(top: 5.0, left: 5.0),
//          hintText: '000',
//          hintStyle: TextStyle(
//              color: Colors.grey, backgroundColor: Colors.transparent),
//          border: OutlineInputBorder(
//              borderRadius: BorderRadius.circular(10.0),
//              borderSide: BorderSide.none),
//          fillColor: Colors.white,
//        ),
//        onSaved: (String value) {
//          fulfillmentQtyController.toString();
//        },
//        validator: (String value) {
//          if (fulfillmentQtyController.text.isEmpty) {
//            return 'Required';
//          } else {
//            // also check for double value existing name in database
//            // we return null when validation succeeds i.e no error in validation
//            return null;
//          }
//        },
//      ),
//    );
//  }
}
