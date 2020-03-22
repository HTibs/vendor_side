import 'package:http/http.dart' as http;

import '../scopedModels/itemsScopedModel.dart';
import '../models/cartItem.dart';
import '../models/item.dart';

class DetailsActivityCartItem {
  String itemId;
  String itemName;
  String requestedQty;
  String fulfilledQty;
  String currentCost;
  String currentSell;
  String currentStock;
  String newSell;
  String margin;

  DetailsActivityCartItem(
      {this.itemId,
      this.itemName,
      this.requestedQty,
      this.fulfilledQty,
      this.currentCost,
      this.currentSell,
      this.currentStock,
      this.margin,
      this.newSell});

  createDetailsActivityCartItem(CartItem recievedCartItem) {
    DetailsActivityCartItem temp;

    Item _item = ItemsScopedModels()
        .getSingleItemFuture(recievedCartItem.itemId) as Item;
    temp.itemName = recievedCartItem.itemName;
    temp.itemId = recievedCartItem.itemId;
    temp.requestedQty = recievedCartItem.requestedQty;
    temp.currentSell = recievedCartItem.pricePerUnit;
    temp.currentCost = _item.costPrice;
    temp.currentStock = _item.stock;
    temp.newSell = _item.sellPrice;
    temp.margin = _item.code;
    temp.fulfilledQty = recievedCartItem.requestedQty;

    return temp;
  }
}
