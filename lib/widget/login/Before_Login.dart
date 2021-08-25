import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:async_button_builder/async_button_builder.dart';
import 'Sign_in.dart';
import 'Sign_up.dart';


const Color fiamzia_blue_principal = Color(0xffcae3f6);
const Color fiamzia_grey_principal = Color(0xff707070);


class Before_Login extends StatefulWidget {
  @override
  _Before_LoginState createState() => new _Before_LoginState();
}


class _Before_LoginState extends State<Before_Login> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double widthScreen = MediaQuery. of(context). size. width ;
    double heightScreen = MediaQuery. of(context). size. height;

    ImageProvider backgroundImage = AssetImage('assets/images/fiamzia_background.png');
    backgroundImage.resolve(createLocalImageConfiguration(context));

    ImageProvider buttonImage = AssetImage('assets/images/down.png');
    buttonImage.resolve(createLocalImageConfiguration(context));

    final textStyleButton = TextStyle(
      color: fiamzia_grey_principal,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    final shadow = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 2),
    );

    final boxdecorationButton = BoxDecoration(
      image:DecorationImage(
        image: buttonImage,
        fit: BoxFit.fill,
      ),
    );

    final boxdecoration = BoxDecoration(

      color: Colors.grey,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],

    );

    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: backgroundImage,
              fit: BoxFit.cover,
            )
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          padding: const EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          child:  Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("Fiamzia",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoMono',
                      color: fiamzia_grey_principal,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Image.asset('assets/images/fiamzia_logo.png', height: 60.0, )
                ],
              ),
              SizedBox(height: 20,),
              Text('Choose and buy Algerian products online',
                textWidthBasis: TextWidthBasis.longestLine,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoMono',
                  //fontWeight: FontWeight.bold,
                  color: fiamzia_grey_principal,
                ),
              ),
              SizedBox(height: 100,),
              GestureDetector(
                child: Container(
                  decoration: boxdecoration,
                  width: widthScreen - 100,
                  height: 50,
                  //alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sign_up()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(fiamzia_blue_principal),

                      ),
                      child: Text("Join Now",
                        style: textStyleButton,
                        //  textAlign: center,
                      ),
                    ) ,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                child: Container(
                  decoration: boxdecorationButton,
                  width: widthScreen - 100,
                  height: 50,
                  //alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sign_in(null)),
                        );
                      },
                      style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all(Colors.white),
                        shadowColor: MaterialStateProperty.all(Colors.grey),
                        // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),

                      ),
                      child: Text("Login",
                        style: textStyleButton,
                      ),
                    ) ,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.bottomRight,
                child: AsyncButtonBuilder(
                  child: Text('Skip ->', style: TextStyle(
                    color: fiamzia_grey_principal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  ),
                  onPressed: () async {
                    await Future.delayed(Duration(seconds: 1));
                  },
                  builder: (context, child, callback, _) {
                    return TextButton(
                      child: child,
                      onPressed: callback,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}