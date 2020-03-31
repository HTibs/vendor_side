import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/item.dart';
import '../services/connections.dart' as connection;
import '../widgets/addSubtractValueWidget.dart';

class ItemsScopedModels extends Model {
  static  List<Item> allItemsList =[];
  Item _item;

  static Future<List<Item>> getAllItemsListFuture() async {
    // create the list of all items here and then return it to future builder
    // in thew future builder use this list for listview builder
    http.Response result = await http.get(connection.itemsUrl);
    print(result.statusCode);
    print(result.body);
    print('if printing the json text then working fine');
    return parseItem(result.body);
  }

  static List<Item> parseItem(String responseBody) {
    // referred the official docs
    // A function that converts a response body into a List<Item>.
    // this function is used in the above future
    // here an isolate can also be created such that the working of slower devices is better
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    allItemsList = parsed.map<Item>((json) => Item.fromJson(json)).toList();
    return allItemsList;
  }

  static Widget allItemsFutureBuilder(BuildContext context) {
    return FutureBuilder<List<Item>>(
        future: getAllItemsListFuture(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? allItemsListBuilder(snapshot.data)
              : Center(child: CircularProgressIndicator());
        });
  }

  static Widget allItemsListBuilder(List<Item> all) {
    return ListView.builder(
        itemCount: ItemsScopedModels.allItemsList.length,
        itemBuilder: (BuildContext context, int index) {
          TextEditingController _stockCntrl = new TextEditingController(
              text: ItemsScopedModels.allItemsList[index].stock);
          TextEditingController _costPriceCntrl = new TextEditingController(
              text: ItemsScopedModels.allItemsList[index].costPrice);
          TextEditingController _sellPriceCntrl = new TextEditingController(
              text: ItemsScopedModels.allItemsList[index].sellPrice);
          return Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                //TODO: remove the bluegrey color and make it white better UI
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white),
            child: Row(
              children: <Widget>[
                Container(
                  // for the image
                  width: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0))),
                  child: Image.network(
                    ItemsScopedModels.allItemsList[index].imageURI,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: 240.0,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${ItemsScopedModels.allItemsList[index].name}',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  textBaseline: TextBaseline.alphabetic),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '${ItemsScopedModels.allItemsList[index].code}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  textBaseline: TextBaseline.alphabetic),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          spacing: 15.0,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 40.0,
                                  width: 60.0,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(-5.0),
                                        hintStyle: TextStyle(
                                            fontSize: 20.0, color: Colors.grey),
                                        hintText:
                                            '${ItemsScopedModels.allItemsList[index].stock}',
                                        filled: true,
                                        fillColor: Color(0xFFF1F1F2)),
                                    onChanged: (value) {
                                      ItemsScopedModels
                                          .allItemsList[index].stock = value;
                                      print(
                                          'ndjfndjsfnjdsnfjd${ItemsScopedModels.allItemsList[index].stock}');
                                    },
                                  ),
                                ),
                                Text(
                                  'Stock  Kgs',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10.0),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 40.0,
                                  width: 60.0,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(-5.0),
                                        hintStyle: TextStyle(
                                            fontSize: 20.0, color: Colors.grey),
                                        hintText:
                                            '${ItemsScopedModels.allItemsList[index].costPrice}',
                                        filled: true,
                                        fillColor: Color(0xFFF1F1F2)),
                                    onChanged: (value) {
                                      ItemsScopedModels.allItemsList[index]
                                          .costPrice = value;
                                    },
                                  ),
                                ),
                                Text(
                                  'Cost Price',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10.0),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 40.0,
                                  width: 60.0,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(-5.0),
                                        hintStyle: TextStyle(
                                            fontSize: 20.0, color: Colors.grey),
                                        hintText:
                                            '${ItemsScopedModels.allItemsList[index].sellPrice}',
                                        filled: true,
                                        fillColor: Color(0xFFF1F1F2)),
                                    onChanged: (value) {
                                      ItemsScopedModels.allItemsList[index]
                                          .sellPrice = value;
                                    },
                                  ),
                                ),
                                Text(
                                  'Sell Price',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10.0),
                                )
                              ],
                            ),

                            //addSubtractValue(_stockCntrl, 'Stock'),
                            //addSubtractValue(_costPriceCntrl, 'Cost Price'),
                            //addSubtractValue(_sellPriceCntrl, 'Sell Price')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
  // ),
  //);

  Future<Item> getSingleItemFuture(String code) async {
    String newurl;
    newurl = connection.itemsSearchUrl + code;
    http.Response result = await http.get(newurl);
    print(result);
    var parsed = json.decode(result.body);
    print(parsed);
    Item nitem = new Item.fromJson(parsed[0]);
    print(nitem);
    return nitem;
  }

  saveDb() async {
    print(allItemsList[0].costPrice);
    print(allItemsList[1].costPrice);
    print(jsonEncode(allItemsList));
    String temp = allItemsListToJson(allItemsList);
    print('dshdjshdjsdhkshdskjadhkjasdhkjsahdkjsdksdhkjasdhkjsdkshdkja');
    print(temp);
    Map<String, String> header = {"Content-type": "application/json"};
    http.Response response = await http.put(connection.itemsBulkUpdateUrl,
        headers: header, body: jsonEncode(allItemsList));
    int statuscode = response.statusCode;
  }
}
