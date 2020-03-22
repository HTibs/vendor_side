class DummyData {
  DummyData() {
    getDummyItem();
  }
  Map<String, dynamic> getDummyItem() {
    final Map<String, dynamic> dummyItem = {
      'name': 'first Dummy Item',
      'code': '0001',
      'description': 'this is a desctiont of the first item',
      'openingStock': '100',
      'costPrice': '83',
      'sellPrice': '45',
      'image': '',
    };
    return dummyItem;
  }
// data for login
  // one for admin i.e admin admin
  // and one for users i.e is users users

  // data for items and data for previous orders

}
