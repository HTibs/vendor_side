import 'package:flutter/material.dart';

import 'router.dart' as router;
import 'activities/loginActivity.dart';
import 'activities/homeActivity.dart';
import 'activities/createItemActivity.dart';
import 'activities/manageInventoryActivity.dart';
import 'activities/orderDetailsActivity.dart';
//import 'models/order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  int temp = 10;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
          accentColor: Colors.yellow),
      // home: LoginActivity(), this is not specified with '/' route
      onGenerateRoute: router.generateRoute,
      initialRoute: '/home',
    );
  }
}
