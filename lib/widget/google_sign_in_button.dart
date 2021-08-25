import 'package:fiamzia/constants/custom_colors.dart';
import 'package:fiamzia/widget/home_screen.dart';
import 'package:fiamzia/utils/User_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(CustomColors.fiamziaBlue),
      )
          : OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),
          ),
          ),
        ),
        onPressed: () async {
          setState(() {
            _isSigningIn = true;
          });

          User_data user ;

          if (user.isLogged) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('email', user.getuserEmail());
            _showToast(context, user.getMessage(), Colors.green);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home_screen(User_data: user),),
            );
          }else{
            _showToast(context, user.getMessage(), Colors.orange);
          }

          setState(() {
            _isSigningIn = false;
          });

          if (user != null) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Home_screen(User_data: user,),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
}