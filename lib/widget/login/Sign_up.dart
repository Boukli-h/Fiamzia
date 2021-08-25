import 'dart:convert';

import 'package:fiamzia/utils/User_data.dart';
import 'package:fiamzia/utils/Validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:async_button_builder/async_button_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../home_screen.dart';
import 'Sign_in.dart';


const Color fiamzia_blue_principal = Color(0xffcae3f6);
const Color fiamzia_grey_principal = Color(0xff707070);

class Sign_up extends StatefulWidget {
  @override
  _Sign_upState createState() => new _Sign_upState();
}


class _Sign_upState extends State<Sign_up> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  //CircleBarProcessing value
  bool _isProcessing = false;
  // Initially create password is obscure
  bool _passwordVisible = true;

  @override
  void initState() {

    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {

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
                children: <Widget>[
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
                        SizedBox(height: 30,),
                        Text("Already have an account?",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'RobotoMono',
                            //fontWeight: FontWeight.bold,
                            color: fiamzia_grey_principal,
                          ),
                        ),
                        Container(
                          child: AsyncButtonBuilder(
                            child: Text('Sign In', style: TextStyle(
                              color: fiamzia_grey_principal,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            ),
                            onPressed: () async {
                              await Future.delayed(Duration(milliseconds: 600));
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Sign_in(null)),
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
                              controller: userNameController,
                              validator: (value) => Validator.validateName(
                                name: value,
                              ),
                              //keyboardType: inputType,
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding:
                                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "User Name"),
                            )
                        ),
                        SizedBox(height: 20,),
                        Container(
                            decoration: boxdecorationTextField,
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
                              keyboardType: TextInputType.name,
                              controller: passwordController,
                              validator: (value) => Validator.validatePassword(
                                password: value,
                              ),
                              //controller: _userPasswordController,
                              obscureText: !_passwordVisible,  //This will obscure text dynamically
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding:
                                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Create a Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: fiamzia_grey_principal,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                            )
                        ),
                        SizedBox(height: 20,),
                        _isProcessing ? CircularProgressIndicator() :
                        Container(
                          decoration: boxdecorationButton,
                          width:400,
                          height: 50,
                          //alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child:TextButton(
                              onPressed: () async{
                                // Button Join Now Action on press
                                _focusEmail.unfocus();
                                _focusPassword.unfocus();

                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    _isProcessing = true;
                                  });
                                  User_data user = User_data();
                                  try{
                                    user = await post(userNameController.text, emailController.text, passwordController.text);
                                    if(user.isLogged){
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setString('email', user.getuserEmail());
                                      _showToast(context, user.getMessage(), Colors.green);
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home_screen(User_data: user),),
                                      );
                                    }else{
                                      _showToast(context, user.getMessage(), Colors.orange);
                                    }
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
                              child: Text("Sign Up",
                                style: textStyleButton,
                                //  textAlign: center,
                              ),
                            ) ,
                          ),
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

  Future<User_data> post(String username, String email, String password) async {
    User_data user = User_data();
    var result = await http.post(
        Uri.parse("https://fiamzia.000webhostapp.com/fiamzia/add_user.php"),
      headers: {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        //"Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
        body: {
          "username": username,
          "email": email,
          "password": password
        },
    );
    //print(result.body);
    if(result.statusCode == 200){
      if(result.body.isNotEmpty) {
        Map<String, dynamic> map = jsonDecode(result.body);
        int code = map['code'];
        user.setMessage(map['message']);
        user.setuserName(username);
        user.setuserEmail(email);
        user.setuserPasword(password);

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
}