import 'package:flutter/material.dart';

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
        body: Container(
            width: screenWidth,
            height: screenHeight,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 10.0),
              child: ListView(
                children: <Widget>[
                  currentOrderListCard(),
                  currentOrderListCard(),
                ],
              ),
            )),
      ),
    );
  }

  Widget currentOrderListCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Colors.white),
        height: 100.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    // container for text
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Restaurant name',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          'Order ID',
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50.0,
                            height: 50.0,
                            child: Icon(
                              Icons.hourglass_empty,
                              color: Colors.grey,
                              size: 36.0,
                            ),
                          ),
                          Text(
                            'Pending',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 100.0,
              height: 30.0,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Details',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // open details of the order
                  // call funtion of order details while passing the order id to it
                  // getOrderDetails(String orderID);
                  Navigator.pushNamed(context, '/orderDetails');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getCurrentOrdersDummyData() {}
}
