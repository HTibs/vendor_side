import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//TextEditingController inputCntrl, String text, BuildContext context) {

class addSubtractValue extends StatefulWidget {
  TextEditingController inputCntrl;
  String text;
  @override
  _addSubtractValueState createState() => _addSubtractValueState();
}

class _addSubtractValueState extends State<addSubtractValue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 2,
          )
        ],
      ),
    );
  }
}
