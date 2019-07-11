import 'package:flutter/material.dart';

class Login extends StatelessWidget {

//TODO: create varaibles that would hold the userid

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(fontSize: 32.0),
                ),
                Text(
                  'enter userId',
                  style: TextStyle(fontSize: 12.0),
                )
              ],
            ),
            Form(
              //TODO: implement key for form
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Userid'),
                ),
              ),
            ),
            Column(
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  // color: Colors.tealAccent,
                  onPressed: null,
                  child: Text(
                    'login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
