import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scopedModels/ordersScopedModel.dart';

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    // all functions to await list items
//    Future<List<Widget>> _currentOrdersList() async {
//      List<Widget> _currentOrders = new List<Widget>();
//    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Current Orders'),
        ),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Manage Inventory'),
                onTap: () {
                  Navigator.pushNamed(context, '/manageInventory');
                  // route for managong inventory page
                },
              ),
              ListTile(
                // also add prefix icon
                title: Text('Add Item'),
                onTap: () {
                  Navigator.pushNamed(context, '/createItem');
                },
              )
            ],
          ),
        ),
        body: ScopedModel(
          model: OrdersScopedModel(),
          child: Container(
              width: screenWidth,
              height: screenHeight,
              color: Colors.grey,
              child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 8.0, left: 10.0),
                  child: ScopedModelDescendant<OrdersScopedModel>(builder:
                      (BuildContext context, Widget child,
                          OrdersScopedModel model) {
                    return model.allItemsFutureBuilder(context);
                  }))),
        ),
      ),
    );
  }
}
