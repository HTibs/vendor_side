import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/services.dart';

import '../services/dummyData.dart';
import '../scopedModels/itemsScopedModel.dart';

class ManageInventoryActivity extends StatefulWidget {
  @override
  _ManageInventoryActivityState createState() =>
      _ManageInventoryActivityState();
}

class _ManageInventoryActivityState extends State<ManageInventoryActivity> {
  TextEditingController _stockCntrl;
  TextEditingController _costPriceCntrl;
  TextEditingController _sellPriceCntrl;
  //TODO: clear out the concept of static and final and const
  //TODO: convert this map to a list
  static Map<String, dynamic> _item = DummyData().getDummyItem();

  final String _itemName = _item['name'];
  final String _itemCode = _item['code'];
  final String _openingStock = _item['openingStock'];
  final String _costPrice = _item['costPrice'];
  final String _sellPrice = _item['sellPrice'];
  final String _image = _item['image'];
//    'name': 'first Dummy Item',
//    'description': 'this is a desctiont of the first item',
//    'openingStock': 100,
//    'costPrice': 83,
//    'sellPrice': 96,
//    'image': '',
//  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //TODO: add controllers intial vaulues with the values recieved from map value
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ItemsScopedModels(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bulk Update Items'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: itemsListBuilder(),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          margin: EdgeInsets.only(top: 2.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.green,
              child: Center(
                child: Text(
                  'Update',
                  style: TextStyle(fontSize: 17.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemsListBuilder() {
    // call dummy itemdata funtion
    //TODO: add dummy data from here
    //Map<String, dynamic> dummyItem = DummyData.getDummyItem();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusScopeNode());
      },
      child: ScopedModelDescendant<ItemsScopedModels>(
        builder: (BuildContext context, Widget child, ItemsScopedModels model) {
          return ItemsScopedModels.allItemsFutureBuilder(context);
        },
      ),
    );
  }
}
