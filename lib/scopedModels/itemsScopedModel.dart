import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/item.dart';
import '../services/connections.dart' as connection;
import '../widgets/addSubtractValueWidget.dart';

class ItemsScopedModels extends Model {
  static List<Item> allItemsList = [];
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
            height: 125.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.blue),
            child: Row(
              children: <Widget>[
                Container(
                  // for the image
                  width: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0))),
                ),
                Container(
                  width: 240.0,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                '${ItemsScopedModels.allItemsList[index].name}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${ItemsScopedModels.allItemsList[index].code}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                ),
                              ),
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
                            addSubtractValue(_stockCntrl, 'Stock', context),
                            addSubtractValue(
                                _costPriceCntrl, 'Cost Price', context),
                            addSubtractValue(
                                _sellPriceCntrl, 'Sell Price', context)
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

  void addItem(Item item) {
    //items.add(item);
    print(item);
  }
}
