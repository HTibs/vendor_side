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
      {this.itemId = '',
      this.itemName = '',
      this.requestedQty = '',
      this.fulfilledQty = '',
      this.currentCost = '',
      this.currentSell = '',
      this.currentStock = '',
      this.margin = '',
      this.newSell = ''});
}
