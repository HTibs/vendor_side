import 'package:flutter/material.dart';

import '../services/dummyData.dart';
import 'package:flutter/services.dart';

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
    _stockCntrl = new TextEditingController(text: _openingStock);
    _costPriceCntrl = new TextEditingController(text: _costPrice);
    _sellPriceCntrl = new TextEditingController(text: _sellPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulk Update Items'),
      ),
      body: Column(
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // add the list of all the items
            children: <Widget>[
              _listItem(),
            ],
          ),
          RaisedButton(
            child: Text('Update All'),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _listItem() {
    // call dummy itemdata funtion
    //TODO: add dummy data from here
    //Map<String, dynamic> dummyItem = DummyData.getDummyItem();
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 5.0, top: 10.0),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusScopeNode());
        },
        child: Container(
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
                              '$_itemName',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '$_itemCode',
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
                          _addSubtractValue(_stockCntrl, 'Stock'),
                          _addSubtractValue(_costPriceCntrl, 'Cost Price'),
                          _addSubtractValue(_sellPriceCntrl, 'Sell Price')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addSubtractValue(TextEditingController inputCntrl, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 60.0,
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5.0)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: 60.0,
                  child: TextField(
                    // opening stick
                    controller: inputCntrl,
                    textAlign: TextAlign.center,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(fontSize: 20.0),
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide.none),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: IconButton(
                        iconSize: 25.0,
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(Icons.remove),
                        color: Theme.of(context).primaryColor,
                        splashColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          setState(() {
                            int value = int.parse(inputCntrl.text);
                            value--;
                            inputCntrl.text = '$value';
                            // decrease the value by one
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: IconButton(
                        iconSize: 25.0,
                        padding: EdgeInsets.all(0.0),
                        splashColor: Theme.of(context).primaryColor,
                        icon: Icon(Icons.add),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          setState(() {
                            int value = int.parse(inputCntrl.text);
                            value++;
                            inputCntrl.text = '$value';
                            // decrease the value by one
                          });
                          // add the value by one
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Text(
          '$text',
          style: TextStyle(fontSize: 12.5, color: Colors.grey),
        )
      ],
    );
  }
}
