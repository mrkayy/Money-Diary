import 'package:flutter/material.dart';
import 'package:moneydairy/screens/dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loggedIn = false;

  final _formKey = GlobalKey<FormState>();
  final mainKey = GlobalKey<ScaffoldState>();

  String _user, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,  
      // resizeToAvoidBottomPadding: false,
      key: mainKey,
      body: loggedIn == false ? Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 32.0),
                  ),
                  // Text(
                  //   'enter userId',
                  //   style: TextStyle(fontSize: 12.0),
                  // ),
                  Form(
                    //TODO: implement key for form
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          validator: (value) =>
                              !value.contains('@') ? 'invalid email' : null,
                          onSaved: (value) => _user = value,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        TextFormField(
                          validator: (value) => value.length <= 4
                              ? 'password must be more than 4 characters'
                              : null,
                          onSaved: (value) => _password = value,
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        SizedBox(height: 24.0),
                        RaisedButton(
                          color: Theme.of(context).accentColor,
                          onPressed: onSave,
                          child: Text(
                            'login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> DashBoard() )
          //Navigator.of(context).pushNamedAndRemoveUntil('/dashboard', (Route<dynamic> route) => ture),
          // Column(
          //   children: <Widget>[
          //     Text('Welcome $_user'),
          //     Padding(
          //         padding: EdgeInsets.all(10.0),
          //         child: FlatButton(
          //           child: Text('logout'),
          //           onPressed: () => setState((){
          //             loggedIn = false;
          //           }),
          //         ))
          //   ],
          ),
    );
  }

  void onSave() {
    var form = _formKey.currentState;
    if (form.validate()) {
      //TODO: add navigator route
      form.save();
      setState(() {
        loggedIn = true;
      });
      print('form is valid');
      print('user: $_user & password: $_password');
    } else {
      print('form field error');
    }

    //TODO: add login to firebase
  }
}
