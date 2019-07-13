import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  final FirebaseUser user;

  const DashBoard({
    Key key, 
    @required this.user
    }) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.supervised_user_circle),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome ${widget.user.email}'),
      ),
    );
  }
void navToSignUp(){

}
void navToSignIn(){
  
}

}
