import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/item.dart';
import '../services/connections.dart' as connection;

class ItemsScopedModels extends Model {
  Item _item;

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

  List<Item> _items = [];

  List<Item> get items {
    return List.from(_items);
  }

  void addItem(Item item) {
    _items.add(item);
    print(item);
  }
}
