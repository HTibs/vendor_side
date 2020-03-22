import 'package:scoped_model/scoped_model.dart';
import '../models/item.dart';

class ItemsScopedModels extends Model {
  List<Item> _items = [];

  List<Item> get items {
    return List.from(_items);
  }

  void addItem(Item item) {
    _items.add(item);
    print(item);
  }
}
