import 'package:flutter/material.dart';

// for date and time formatying import 'package:intl/intl.dart';
class LoginActivity extends StatefulWidget {
  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final textUsernameController = new TextEditingController();
  final textPasswordController = new TextEditingController();

  @override
  void dispose() {
    textUsernameController.dispose();
    textPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var today = new DateTime.now();
    int date = today.day;
    int year = today.year;
    int month = today.month;

    //var daye =new DateFormat.yMMMd('en_US').format(new DateTime.now());

    return SafeArea(
      child: Scaffold(
        body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Vendor Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '$date/$month/$year',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                // this is the username filed
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: 200.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextField(
                    controller: textUsernameController,
                    cursorColor: Colors.green,
                    //autofocus: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10.0),
                        hintText: 'username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))
                        // labelText: 'username',
                        //labelStyle: TextStyle(fontSize: 17.5),
                        ),
                    style: TextStyle(fontSize: 17.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                // this is the password field
                Container(
                  width: 200.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextField(
                    controller: textPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10.0),
                        hintText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )
                        // labelText: 'username',
                        //labelStyle: TextStyle(fontSize: 17.5),
                        ),
                    style: TextStyle(fontSize: 17.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text('login'),
                  onPressed: () {
                    validateLogin(textUsernameController.text,
                        textPasswordController.text);
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            )),
      ),
    );
  }

  // validate function definition

  void validateLogin(String textUsername, String textPassword) {
    if (textUsername == 'admin' && textPassword == 'admin') {
      print('login succeful');
      Navigator.pushNamed(context, '/home');
      // start the next activity i.e the gome activity
    } else {
      print('unsucdefull login');
      // clear the fields and dispply the error
    }
  }
}
