import 'package:flutter/material.dart';

import 'activities/orderDetailsActivity.dart';
import 'activities/homeActivity.dart';
import 'activities/createItemActivity.dart';
import 'activities/manageInventoryActivity.dart';
import 'activities/loginActivity.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      // add the login activity here later
      return MaterialPageRoute(builder: (context) => HomeActivity());
    case '/home':
      return MaterialPageRoute(builder: (context) => HomeActivity());
    case '/createItem':
      return MaterialPageRoute(builder: (context) => CreateItemActivity());
    case '/manageInventory':
      return MaterialPageRoute(builder: (context) => ManageInventoryActivity());
    case '/orderDetails':
      var argument = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => OrderDetailsActivity(argument));
    default:
      return MaterialPageRoute(builder: (context) => LoginActivity());
  }
}
