import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/item.dart';
import '../services/connections.dart' as connection;

class ItemsScopedModels extends Model {
  Item _item;

  Future<Item> getSingleItemFuture(String code) async {
    http.Response result = await http.get(connection.itemsUrl);
    var parsed = json.decode(result.body).cast<Map<String, dynamic>>();
    _item = parsed.map<Item>((json) => Item.fromJson(json)).toList();
    return _item;
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
