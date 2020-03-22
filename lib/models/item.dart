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
  saveDatatoDB(Item _item) {
    // generate an item code here
    // create a function to generate an item code
    // create a list of items and the product to this list
    // List<Products> _itemsList
    print('data to be saved to DB');
    print(_item.name);
    print(_item.sellPrice);
    // once the item is saved to DB succefssfully
  }

  int _generateItemCode(
    List<Item> _itemList,
  ) {
    if (_itemList.length == 0) {
      return 1001;
    } else
      return (1001 + _itemList.length);
  }
}
