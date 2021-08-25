import 'package:fiamzia/utils/User_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login/Before_Login.dart';


const Color fiamzia_blue_principal = Color(0xffcae3f6);
const Color fiamzia_grey_principal = Color(0xff707070);

class Home_screen extends StatefulWidget{
  //final User user;

  const Home_screen({User_data User_data});

  _Home_screenState createState() => new _Home_screenState();
}
class _Home_screenState extends State<Home_screen>{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text("FiaMzia"), backgroundColor: fiamzia_blue_principal,),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('BOULOUZA NASSER', style: new TextStyle(color: fiamzia_grey_principal),),
              accountEmail: new Text('boulouza.nacer@gmail.com',style: new TextStyle(color: fiamzia_grey_principal)),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage('https://lh3.googleusercontent.com/ogw/ADea4I4ifxyUG7UUoxsRlQ172DHk163laUoB_So95m2xrA=s83-c-mo'),
                ),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage('assets/images/fiamzia_background.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            new ListTile(
              trailing: new Icon(Icons.headset_rounded),
              title: new Text("My Favorites"),
            ),
            new ListTile(
              trailing: new Icon(Icons.headset_rounded),
              title: new Text("Purchases"),
            ),
            new Divider(height: 2, color: Colors.black,),
            new ListTile(
              trailing: new Icon(Icons.inbox),
              title: new Text("Inbox"),
            ),
            new ListTile(
              trailing: new Icon(Icons.sell),
              title: new Text("Sell"),
            ),
            new Divider(height: 2, color: Colors.black,),
            new ListTile(
              trailing: new Icon(Icons.account_box),
              title: new Text("About"),
            ),
            new ListTile(
              trailing: new Icon(Icons.settings),
              title: new Text("Setting"),
            ),
            new ListTile(
              trailing: new Icon(Icons.logout),
              title: new Text("Logout"),
            ),
          ],
        ),
      ),
      body: new Center(
        child: new TextButton(
          onPressed: () async {
            //FireAuth.signOut();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Before_Login(),));
          },
          child: Text("Log out"),
        ),
      ),
    );
  }
}
