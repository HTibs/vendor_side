import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget addSubtractValue(
    TextEditingController inputCntrl, String text, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 60.0,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
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
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  style: TextStyle(fontSize: 20.0),
                  cursorColor: Colors.green,
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
                        //setState(() {
                        int value = int.parse(inputCntrl.text);
                        value--;
                        inputCntrl.text = '$value';
                        // decrease the value by one
                        //});
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
                        //setState(() {
                        int value = int.parse(inputCntrl.text);
                        value++;
                        inputCntrl.text = '$value';
                        // decrease the value by one
                        //});
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
