import 'package:flutter/material.dart';
import '../widgets/imageInputWidget.dart';
import 'package:flutter/services.dart';
import '../models/item.dart';

class CreateItemActivity extends StatefulWidget {
  @override
  _CreateItemActivityState createState() => _CreateItemActivityState();
}

class _CreateItemActivityState extends State<CreateItemActivity> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Item> _itemList = [];
  Item _itemInputData = Item();

  final imageController = new TextEditingController();
  final nameController = new TextEditingController();
  final descriptionController = new TextEditingController();
  final openingStockController = new TextEditingController();
  final costPriceController = new TextEditingController();
  final sellPriceController = new TextEditingController();

  @override
  void dispose() {
    imageController.dispose();
    nameController.dispose();
    descriptionController.dispose();
    openingStockController.dispose();
    costPriceController.dispose();
    sellPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Item Details'),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      //TODO: recieve the image link and pass to itemMap and then to db
                      ImageInput(),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        // name
                        controller: nameController,
                        style: TextStyle(fontSize: 17.5),
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          labelText: 'Name*',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              backgroundColor: Colors.transparent),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          fillColor: Colors.white,
                        ),
                        onSaved: (String value) {
                          setState(() {
                            _itemInputData.name = value;
                          });
                        },
                        validator: (String value) {
                          // validate and check if the name already exists in db
                          // return null if error free input
                          if (nameController.text.isEmpty) {
                            return 'Name is Required';
                          } else {
                            // also check for existing name in database
                            // we return null when validation succeeds i.e no error in validation
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      // container for description of item
                      TextFormField(
                        // Description
                        maxLines: 4,
                        style: TextStyle(fontSize: 17.5),
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              backgroundColor: Colors.transparent),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          fillColor: Colors.white,
                        ),
                        onSaved: (String value) {
                          setState(() {
                            _itemInputData.description = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Openig Stock*',
                                style: TextStyle(
                                    fontSize: 12.5, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                height: 60.0,
                                width: 100.0,
                                child: TextFormField(
                                  // opening stick
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],

                                  style: TextStyle(fontSize: 17.5),
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5.0, left: 5.0),
                                    hintText: '00 Kgs',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        backgroundColor: Colors.transparent),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    fillColor: Colors.white,
                                  ),
                                  onSaved: (String value) {
                                    setState(() {
                                      _itemInputData.stock = value;
                                    });
                                  },
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Required';
                                    } else {
                                      // also check for double value existing name in database
                                      // we return null when validation succeeds i.e no error in validation
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Cost Price*',
                                style: TextStyle(
                                    fontSize: 12.5, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                height: 60.0,
                                width: 100.0,
                                child: TextFormField(
                                  // cost price
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  style: TextStyle(fontSize: 17.5),
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5.0, left: 5.0),
                                    hintText: ' Rs. 00',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        backgroundColor: Colors.transparent),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    fillColor: Colors.white,
                                  ),
                                  onSaved: (String value) {
                                    setState(() {
                                      _itemInputData.costPrice = value;
                                    });
                                  },
                                  validator: (String value) {
                                    // validation for double is required for now only digit input
                                    //TODO: add validation for double values in SP CP and OS
                                    if (value.isEmpty) {
                                      return 'Required';
                                    } else {
                                      // also check for double value existing name in database
                                      // we return null when validation succeeds i.e no error in validation
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Selling Price*',
                                style: TextStyle(
                                    fontSize: 12.5, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                height: 60.0,
                                width: 100.0,
                                child: TextFormField(
                                  // sell price
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  style: TextStyle(fontSize: 17.5),
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5.0, left: 5.0),
                                    hintText: '0.0',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        backgroundColor: Colors.transparent),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    fillColor: Colors.white,
                                  ),
                                  onSaved: (String value) {
                                    setState(() {
                                      _itemInputData.sellPrice = value;
                                    });
                                  },
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Required';
                                    } else {
                                      // also check for double value existing name in database
                                      // we return null when validation succeeds i.e no error in validation
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        child: Text('Save'),
                        onPressed: () {
                          // call function to save form data to item class and then to database
                          // add validate functions to all the fields
                          // call functio to create item passing all the values
                          _submitForm();
                        },
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  //TODO: not sure if can return a widget in on pressed function
  void _submitForm() {
    // this line of code executes all the onSaved methods of textformfields
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    _itemInputData.saveDatatoDB(_itemInputData);
    // clear form fields and give a toast to save item code
    //TODO: send the _itemFormData map to createProduct()n function of itmes
    // call the create product function hewre passing the receinve map
    // createItem(_itemFormData);
    //TODO: implement a dialog box with the saved item code

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Item Created "),
          content: new Text("Item Code 1001"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.pushNamed(context, '/createItem');
              },
            ),
          ],
        );
      },
    );
    // now clear all the textfields
  }
}
