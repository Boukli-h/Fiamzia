import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}


class _MyAppState extends State<MyApp> {


  Future<Widget> loadFromFuture() async {

    // <fetch data from server. ex. login>

    return Future.value(new AfterSplash());
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      //use this line if you want the splash stay until load from future terminate.
      //navigateAfterFuture: loadFromFuture(),

        seconds: 8,
        navigateAfterSeconds: new AfterSplash(),
        /* title: new Text('FiaMia Loading ...',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0
          ),),*/
        //image: new Image.asset('assets/images/screen.png'),
        loadingText: Text("FiaMzia loading..."),
        backgroundColor: Colors.white,
        imageBackground: Image.asset('assets/images/splash_screen.png').image,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Splash screen clicked"),
        loaderColor: Colors.red
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("FiaMzia"),
          automaticallyImplyLeading: false
      ),
      body: new Center(
        child: new Text("Welcome to FiaMzia corporation !",
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}