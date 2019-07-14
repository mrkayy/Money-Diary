import 'package:flutter/material.dart';
import 'package:moneydairy/setup/login.dart';
import 'package:moneydairy/screens/dashboard.dart';
import 'package:moneydairy/setup/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: <String, WidgetBuilder>{
        '/login': (context) => Login(),
        '/signup': (cotext) => SignUp(),
        '/dashboard': (context) => DashBoard(),
      },
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /*
   *  initState() reroutes to loginPage after 3sec
   *  TODO: splashScreen page load animation in splash screen
   */
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        //TODO: animate login and signup button into screen
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        /* the splash screen background start the stack */
        //TODO: App should network dependencies while splashScreen loads
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
        //enclose appLogo inside center>physicalModal>gestureDetector
        Center(
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
      ],
    );
  }
}
