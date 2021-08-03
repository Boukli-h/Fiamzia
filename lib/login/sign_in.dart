import 'package:fiamzia/login/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:async_button_builder/async_button_builder.dart';
import 'Forget_password.dart';




void main(){
  runApp(new MaterialApp(
    home: new Sign_in(),
  ));
}

const Color fiamzia_blue_principal = Color(0xffcae3f6);
const Color fiamzia_grey_principal = Color(0xff707070);

class Sign_in extends StatefulWidget {
  @override
  _Sign_inState createState() => new _Sign_inState();
}


class _Sign_inState extends State<Sign_in> {

  @override
  Widget build(BuildContext context) {

    bool checkedValue = false;

    ImageProvider backgroundImage = AssetImage('assets/images/fiamzia_background.png');
    backgroundImage.resolve(createLocalImageConfiguration(context));

    ImageProvider buttonImage = AssetImage('assets/images/down.png');
    buttonImage.resolve(createLocalImageConfiguration(context));

    final textStyleButton = TextStyle(
      color: fiamzia_grey_principal,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );


    final boxdecorationTextField = BoxDecoration(
      image:DecorationImage(
        image: buttonImage,
        fit: BoxFit.fill,
      ),
    );

    final boxdecorationButton = BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(20),
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
          margin: const EdgeInsets.only(left: 50.0, right: 50.0),
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
                  Image.asset('assets/images/fiamzia_logo.png', height: 100.0, )
                ],
              ),
              SizedBox(height: 40,),
              Text("Don't have an account?",
                textWidthBasis: TextWidthBasis.longestLine,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoMono',
                  //fontWeight: FontWeight.bold,
                  color: fiamzia_grey_principal,
                ),
              ),
              Container(
                child: AsyncButtonBuilder(
                  child: Text('Sign Up',
                    textWidthBasis: TextWidthBasis.longestLine,
                    style: TextStyle(
                      color: fiamzia_grey_principal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () async {
                    await Future.delayed(Duration(milliseconds: 600));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sign_up()),
                    );
                  },
                  builder: (context, child, callback, _) {
                    return TextButton(
                      child: child,
                      onPressed: callback,
                    );
                  },
                ),
              ),
              SizedBox(height: 40,),
              Container(
                decoration: boxdecorationTextField,
                child: TextFormField(
                  cursorColor: Colors.black,
                  //keyboardType: inputType,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Email"),
                )
              ),
              SizedBox(height: 20,),
              Container(
                  decoration: boxdecorationTextField,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    //keyboardType: inputType,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Password"),
                  )
              ),
              //SizedBox(height: 20,),
              Row(
                 children: <Widget>[
                   Checkbox(
                     checkColor: Colors.greenAccent,
                     activeColor: Colors.blue,
                     value: checkedValue,
                     onChanged: (bool value) {
                       setState(() {
                         checkedValue = value;
                       });
                     },
                   ),
                   Text('Remember Me ',style: TextStyle(fontSize: 17.0), ),
                 ],
              ),
              SizedBox(height: 15,),
              GestureDetector(
                  child: Container(
                    decoration: boxdecorationButton,
                    width:400,
                    height: 50,
                    //alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child:TextButton(
                        onPressed: (){
                          // Button Join Now Action on press
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(fiamzia_blue_principal),
                        ),
                        child: Text("Sign In",
                          style: textStyleButton,
                          //  textAlign: center,
                        ),
                      ) ,
                    ),
                  ),
              ),
              //SizedBox(height: 10,),
              Container(
                alignment: Alignment.bottomRight,
                child: AsyncButtonBuilder(
                  child: Text('Forget password?', style: TextStyle(
                    color: fiamzia_grey_principal,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  onPressed: () async {
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Forget_password()));
                  },
                  builder: (context, child, callback, _) {
                    return TextButton(
                      child: child,
                      onPressed: callback,
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
              Text('_______________ OR _______________ ',style: TextStyle(fontSize: 20.0), ),
              SizedBox(height: 20,),
              GestureDetector(
                child: Container(
                  decoration: boxdecorationButton,
                  width:400,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:TextButton(
                      onPressed: () {
                        print('Pressed');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(fiamzia_blue_principal),
                      ),
                      child: Text('Connect with google', style: textStyleButton,),
                    ),
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