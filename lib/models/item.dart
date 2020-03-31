import 'package:http/http.dart' as http;
import 'dart:convert';

import '../services/connections.dart';

String allItemsListToJson(List<Item> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Item {
  String code;
  String name;
  String imageURI;
  String costPrice;
  String sellPrice;
  String stock;
  String description;

  Item(
      {this.code,
      this.name,
      this.imageURI,
      this.costPrice,
      this.sellPrice,
      this.stock,
      this.description});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        code: parsedJson['code'],
        name: parsedJson['name'],
        imageURI: parsedJson['imageURI'],
        costPrice: parsedJson['costPrice'],
        sellPrice: parsedJson['sellPrice'],
        stock: parsedJson['stock'],
        description: parsedJson['description']);
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'imageURI': imageURI,
        'costPrice': costPrice,
        'sellPrice': sellPrice,
        'stock': stock,
        'description': description
      };

  // as the item class is now created it can be implmented in other classes
  saveDatatoDB(Item _item) async {
    // generate an item code here
    // create a function to generate an item code
    // create a list of items and the product to this list
    // List<Products> _itemsList
    // http.Response response = await http.post(itemsUrl,
    //   headers: {"Content-Type": "application/json"}, body: jsonEncode(_item));
    Map<String, String> header = {"Content-type": "application/json"};
    http.Response response =
        await http.post(itemsUrl, headers: header, body: jsonEncode(_item));
    var statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400) {
      print(response.statusCode);
      throw new Exception('error while saving data');
    } else {
      print('item added');
      print('data to be saved to DB');
      print(_item.name);
      print(_item.sellPrice);
      return 1;
      // once the item is saved to DB succefssfully
    }
  }
}
