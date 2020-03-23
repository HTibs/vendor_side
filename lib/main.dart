import 'package:flutter/material.dart';

import 'activities/loginActivity.dart';
import 'activities/homeActivity.dart';
import 'activities/createItemActivity.dart';
import 'activities/manageInventoryActivity.dart';
import 'activities/orderDetailsActivity.dart';
import 'models/order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
          accentColor: Colors.yellow),
      // home: LoginActivity(), this is not specified with '/' route
      routes: {
        '/': (BuildContext context) =>
            HomeActivity(), //add login activity to this
        '/home': (BuildContext context) => HomeActivity(),
        '/createItem': (BuildContext context) => CreateItemActivity(),
        '/manageInventory': (BuildContext context) => ManageInventoryActivity(),
        '/orderDetails': (BuildContext context) =>
            OrderDetailsActivity(Order()),
      },
    );
  }
}
