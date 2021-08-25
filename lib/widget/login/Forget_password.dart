import 'dart:convert';

import 'package:fiamzia/utils/User_data.dart';
import 'package:fiamzia/utils/Validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:async_button_builder/async_button_builder.dart';
import 'package:http/http.dart' as http;
import 'Sign_up.dart';



const Color fiamzia_blue_principal = Color(0xffcae3f6);
const Color fiamzia_grey_principal = Color(0xff707070);

class Forget_password extends StatefulWidget {
  @override
  _Forget_passwordState createState() => new _Forget_passwordState();
}


class _Forget_passwordState extends State<Forget_password> {


  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusEmail = FocusNode();
  bool _isProcessing = false;

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
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
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
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("Forget Password?",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'RobotoMono',
                          //fontWeight: FontWeight.bold,
                          color: fiamzia_grey_principal,
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child:Text("Enter your Email Address", textAlign: TextAlign.left,),
                    ),

                    Container(
                        decoration: boxdecorationTextField,
                        width: widthScreen - 100,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: emailController,
                          validator: (value) => Validator.validateEmail(
                            email: value,
                          ),
                          //keyboardType: inputType,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(color: Colors.red,),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding:
                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Email"),

                        )
                    ),
                    SizedBox(height: 20,),
                    _isProcessing ? CircularProgressIndicator() :
                    GestureDetector(
                      child: Container(
                        decoration: boxdecorationButton,
                        width:400,
                        height: 50,
                        //alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child:TextButton(
                            onPressed: () async{
                              // Button Join Now Action on
                              _focusEmail.unfocus();

                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _isProcessing = true;
                                });

                                User_data user = User_data();

                                user = await post(emailController.text);

                                if(user.isLogged){
                                  _showToast(context, user.getMessage(), Colors.green);
                                 // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home_screen(User_data: user),),);
                                }else{
                                  _showToast(context, user.getMessage(), Colors.orange);
                                }
                                try{

                                } on Exception catch(_){
                                  print('never reached');
                                }

                                setState(() {
                                  _isProcessing = false;
                                });
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(fiamzia_blue_principal),
                            ),
                            child: Text("Reset Password",
                              style: textStyleButton,
                              //  textAlign: center,
                            ),
                          ) ,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Text("Remember your password?",
                          style: TextStyle(
                            fontSize: 15,
                            //fontFamily: 'RobotoMono',
                            //fontWeight: FontWeight.bold,
                            color: fiamzia_grey_principal,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: AsyncButtonBuilder(
                            child: Text('Sign In', style: TextStyle(
                              color: fiamzia_grey_principal,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'RobotoMono',
                            ),
                            ),
                            onPressed: () async {
                              await Future.delayed(Duration(seconds: 1));
                              Navigator.push(context,  MaterialPageRoute(builder: (context) => Sign_up()));
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Future<User_data> post(String email) async {
  User_data user = User_data();
  var result = await http.post(
    Uri.parse("https://fiamzia.000webhostapp.com/fiamzia/resetpassword.php"),
    headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      //"Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
    body: {
      "email": email
    },
  );
  //print(result.body);
  if(result.statusCode == 200){
    if(result.body.isNotEmpty) {
      print(result.body);
      Map<String, dynamic> map = jsonDecode(result.body);
      int code = map['code'];
      user.setMessage(map['message']);
      user.setuserEmail(email);

      if (code == 1) {
        user.isLogged = true;
      }else{
        user.isLogged = false;
      }
    }else{
      user.isLogged = false;
      user.setMessage('Error in Json response');
    }
  }
  return user;
}


void _showToast(BuildContext context, String message, Color color) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content:  Text(message),
      action: SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar, textColor: color,),
    ),
  );
}