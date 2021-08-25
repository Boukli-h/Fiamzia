import 'dart:convert';

import 'package:fiamzia/constants/custom_colors.dart';
import 'package:fiamzia/utils/User_data.dart';
import 'package:fiamzia/utils/Validator.dart';
import 'package:fiamzia/widget/google_sign_in_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:async_button_builder/async_button_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../home_screen.dart';
import 'Forget_password.dart';
import 'Sign_up.dart';


class Sign_in extends StatefulWidget {
  const Sign_in(String email);
  @override
  _Sign_inState createState() => new _Sign_inState();
}


class _Sign_inState extends State<Sign_in> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  bool checkedValue = false;


  @override
  Widget build(BuildContext context) {

    double widthScreen = MediaQuery. of(context). size. width ;
    double heightScreen = MediaQuery. of(context). size. height;


    ImageProvider backgroundImage = AssetImage('assets/images/fiamzia_background.png');
    backgroundImage.resolve(createLocalImageConfiguration(context));

    ImageProvider buttonImage = AssetImage('assets/images/down.png');
    buttonImage.resolve(createLocalImageConfiguration(context));

    final textStyleButton = TextStyle(
      color: CustomColors.fiamziaGrey,
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
      body: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: backgroundImage,
                  fit: BoxFit.cover,
                )
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              padding: const EdgeInsets.only(top: 30),
              child:  Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("Fiamzia",
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'RobotoMono',
                                color: CustomColors.fiamziaGrey,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Image.asset('assets/images/fiamzia_logo.png', height: 60.0, )
                          ],
                        ),
                        SizedBox(height: (heightScreen - (heightScreen - 20)),),
                        Text("Don't have an account?",
                          textWidthBasis: TextWidthBasis.longestLine,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'RobotoMono',
                            //fontWeight: FontWeight.bold,
                            color: CustomColors.fiamziaGrey,
                          ),
                        ),
                        Container(
                          child: AsyncButtonBuilder(
                            child: Text('Sign Up',
                              textWidthBasis: TextWidthBasis.longestLine,
                              style: TextStyle(
                                color: CustomColors.fiamziaGrey,
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

                        SizedBox(height: (heightScreen - (heightScreen - 20)),),

                        Container(
                          decoration: boxdecorationTextField,
                          width: widthScreen - 100,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: emailController,
                            validator: (value) => Validator.validateEmail(
                              email: value,
                            ),
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Email",
                              errorBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(color: Colors.red,),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: (heightScreen - (heightScreen - 20)),),
                        Container(
                            decoration: boxdecorationTextField,
                            width: widthScreen - 100,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              controller: passwordController,
                              validator: (value) => Validator.validatePassword(
                                password: value,
                              ),
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding:
                                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Password",
                                errorBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: BorderSide(color: Colors.red,),
                                ),
                              ),
                            )
                        ),
                        //SizedBox(height: 20,),
                        CheckboxListTile( //                   <--- CheckboxListTile
                          title: Text('Remember me'),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue;
                            });
                          },
                          // setting the controlAffinity to leading makes the checkbox come
                          // before the title instead of after it
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        SizedBox(height: (heightScreen - (heightScreen - 15)),),
                        _isProcessing ? CircularProgressIndicator() :
                        GestureDetector(
                          child: Container(
                            decoration: boxdecorationButton,
                            width: widthScreen - 100,
                            height: (heightScreen - (heightScreen - 50)),
                            //alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:TextButton(
                                onPressed: () async {
                                  _focusEmail.unfocus();
                                  _focusPassword.unfocus();

                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _isProcessing = true;
                                    });
                                    User_data user = User_data();
                                    try {
                                      user = await post(emailController.text, passwordController.text);
                                      print("xxxx");
                                      if (user.isLogged) {
                                        print("yyyy");
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        if(checkedValue){
                                          prefs.setString('email', user.userEmail);
                                        }else{
                                          prefs.remove('email');
                                        }
                                        _showToast(context, user.getMessage(), Colors.green);
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home_screen(User_data: user),),
                                        );
                                      }else{
                                        print("hhhhh");
                                        _showToast(context, user.getMessage(), Colors.orange);
                                      }
                                    } on Exception catch (_) {
                                      print('never reached');
                                    }

                                    setState(() {
                                      _isProcessing = false;
                                    });

                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(CustomColors.fiamziaBlue),
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
                              color: CustomColors.fiamziaGrey,
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

                        Text('__________ OR __________ ',style: TextStyle(fontSize: 15.0), ),
                        SizedBox(height: (heightScreen - (heightScreen - 10)),),
                        GestureDetector(
                          child: GoogleSignInButton(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
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

  Future<User_data> post(String email, String password) async {

    User_data user = User_data();
    var result = await http.post(
      Uri.parse("https://fiamzia.000webhostapp.com/fiamzia/sign_in.php"),
      headers: {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        //"Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      },
      body: {
        "email": email,
        "password": password
      },
    );
    print(result.body);
    if(result.statusCode == 200){
      print("aaaaa");
      Map<String, dynamic> map = jsonDecode(result.body);
      print("bbbbb");
      int code = map['code'];
      user.setMessage(map['message']);
      print("ccccc");
      user.setuserEmail(email);
      user.setuserPasword(password);
      print("ddddd");

      if (code == 1) {
        user.isLogged = true;
      }else{
        user.isLogged = false;
      }
      print("vvvv");
    }
    return user;
  }
}