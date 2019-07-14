import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment(-0.1, -0.9),
                colors: [
                  Color(0xff8c0606),
                  Colors.red,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: PhysicalModel(
              shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
              elevation: 10.0,
              child: Padding(
                padding: EdgeInsets.all(13.0),
                child: FlutterLogo(
                    textColor: Colors.black,
                    size: 96,
                    colors: Colors.red,
                    style: FlutterLogoStyle.stacked),
              ),
            ),
          ),
          // Positioned(
          //   top: 90.0,
          //   left: 110.0,
          //   child: FlutterLogo(
          //     textColor: Colors.white,
          //     size: 140,
          //     // colors: Colors.white,
          //     style: FlutterLogoStyle.horizontal,
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      UserLogged()));
                        },
                        color: Colors.red[900],
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                      RaisedButton(
                        onPressed: null,
                        child: Text(
                          'Signup',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: check last logged in time
class UserLogged extends StatelessWidget {
  bool loggedIn = false;

  final _formKey = GlobalKey<FormState>();
  final mainKey = GlobalKey<ScaffoldState>();

  String _email, _password;

  void onSave() {
    var form = _formKey.currentState;
    if (form.validate()) {
      //TODO: add navigator route
      form.save();
      // setState(() {
      //   loggedIn = true;
      // });
      print('form is valid');
      print('user: $_email & password: $_password');
    } else {
      print('form field error');
    }

    //TODO: add login to firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: Form(
          //TODO: implement key for form
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Login'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) =>
                            !value.contains('@') ? 'invalid email' : null,
                        onSaved: (value) => _email = value,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
