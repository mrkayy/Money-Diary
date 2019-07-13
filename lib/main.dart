import 'package:flutter/material.dart';
import 'package:moneydairy/setup/login.dart';
import 'package:moneydairy/screens/dashboard.dart';

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
        '/dashboard': (context) => DashBoard(),
      },
      home: SplashScreen(),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FlutterLogo(size: 80.0),
//       ),
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /*
   *  initState() reroutes to loginPage after 3sec
   *  splashScreen page 
   */
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
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
              child: GestureDetector(
                onTap: null ,
                // () {
                //   Navigator.of(context).pushNamedAndRemoveUntil(
                //       '/login', (Route<dynamic> route) => false);
                // },
                child: FlutterLogo(
                    textColor: Colors.black,
                    size: 96,
                    colors: Colors.red,
                    style: FlutterLogoStyle.stacked),
              ),
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Container(
        //     padding: EdgeInsets.all(12.0),
        //     child: Text(
        //       "powered by: ",
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontStyle: FontStyle.italic,
        //         fontSize: 10,
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
