import 'dart:async';
import 'package:fiamzia/widget/login/Before_Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text/animated_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen.dart';


const Color fiamzia_blue_principal = Color(0xffcae3f6);
const Color fiamzia_grey_principal = Color(0xff707070);

class Splash_screen extends StatefulWidget {
  @override
  _Splash_screenState createState() => new _Splash_screenState();
}


class _Splash_screenState extends State<Splash_screen> {


  Future<Widget> loadFromFuture() async {

    // <fetch data from server. ex. login>

    return Future.value(new Before_Login());
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), ()=> ScreenChoser());
  }

  Future<void> ScreenChoser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    print(email);
    if(email == null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Before_Login()));
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home_screen()));
    }
  }
  @override
  Widget build(BuildContext context) {

    ImageProvider backgroundImage = AssetImage('assets/images/fiamzia_background.png');
    backgroundImage.resolve(createLocalImageConfiguration(context));


    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: backgroundImage,
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: AnimatedText(
                speed: Duration(milliseconds: 1000),
                controller: AnimatedTextController.loop,
                displayTime: Duration(milliseconds: 1000),
                wordList: ['FiaMzia', 'Shoping', 'Online', 'Easier', 'Now.'],
                textStyle: TextStyle(
                    color: fiamzia_grey_principal,
                    fontSize: 45,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 40),
            Image.asset('assets/images/fiamzia_logo.png', height: 200.0,),
            SizedBox(height: 100),
            SpinKitRing(color: Colors.lightBlue),
            SizedBox(height: 10,),
            Text("Loading ...", style: TextStyle(color: fiamzia_grey_principal),),
          ],
        ),
      ),
    );
  }
}