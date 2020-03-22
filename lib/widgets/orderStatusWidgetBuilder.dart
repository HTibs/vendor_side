import 'package:flutter/material.dart';

class OrderStatusWidgetBuilder extends StatefulWidget {
  String status;
  OrderStatusWidgetBuilder(this.status);
  @override
  _OrderStatusWidgetBuilderState createState() =>
      _OrderStatusWidgetBuilderState();
}

class _OrderStatusWidgetBuilderState extends State<OrderStatusWidgetBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.status == 'pending') {
      return Expanded(
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
      );
    } else if (widget.status == 'approved') {
      return Expanded(
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
                  'Approved',
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
      );
    } else if (widget.status == 'declined') {
      return Expanded(
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
                  'Declined',
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
      );
    }
    // else statement is for completed orders
    else {
      return Expanded(
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
                  'Completed',
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
      );
    }
  }
}
