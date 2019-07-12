import 'package:flutter/material.dart';

class Login extends StatelessWidget {

final _formKey = GlobalKey<FormState>();

//TODO: create varaibles that would hold the userid
  String _user;
  String _password;

  //TODO: add initState to check if user has logged in before

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    validator: (value)=> value.isEmpty?'Email can\'t be empty':null,
                    onSaved: (value) => _user = value,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextFormField(
                    validator: (value) => value.length < 4?'password must be more than 4 characters':null,
                    onSaved: (value) => _password = value,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
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
      ),
    );
  }

  void onSave(){
    var form = _formKey.currentState;
    if(form.validate()){
      //TODO: add navigator route 
      form.save();
      print('form is valid');
      print('user: $_user & password: $_password ');
    }else{
      print('form field error');
    }
  }

}
