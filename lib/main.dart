import 'package:flutter/material.dart';
//import 'package:fiamzia/widget/myMenu.dart';



void main() => runApp(Fiamzia());// root widget

class Fiamzia extends StatefulWidget {//create a widget
  @override
  State<Fiamzia> createState() => _FiamziaState();
}

class _FiamziaState extends State<Fiamzia> {
  // List<String> quotes = [
  //   'wafaa',
  //   'hana',
  //   'kamel'
  // ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fiamzia',
      home: Scaffold(// home property should be scaffold widget
        appBar: AppBar(// all widget start with capital letter
          title: const Text(
            'Fiamzia',
            style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 2.0, color: Colors.black54
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image(image: AssetImage('assets/log.png')),
            ),
            Stack(
              children: [
                IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.black54),
                  onPressed: (){
                      // Route route= MaterialPageRoute(builder: (builder) => CartPage());
                      // Navigator.pushReplacement(context, route);
                  },
                ),
                Positioned(
                    child: Stack(
                     children: [
                       Icon(
                         Icons.brightness_1, size: 15.0, color: Colors.red,
                       )
                       // Positioned(
                       //   top: 3.0, bottom: 4.0,
                       // child: Consumer<CartItemCounter>(
                       //   buider:(context, counter, _)
                       //   {
                       //   }
                       // ),)
                     ],
                ))
              ],
            )
          ],
          backgroundColor: Colors.lightBlue[50],// press ctrl+ q to get list of colors
        ),
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  children:<Widget> [
                    Text('User Name'+'\n'+'UserEmail@exemple.com',
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                     SizedBox(width: 20.0),
                     CircleAvatar(backgroundImage: AssetImage('assets/circleAvatar.png'), radius: 40.0,),
                ],
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.favorite_border, color: Colors.black54),
                  title: Text("My favorites",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_basket_rounded, color: Colors.black54),
                  title: Text("Purchases",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.all_inbox, color: Colors.black54),
                  title: Text("Inbox",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.money, color: Colors.black54),
                  title: Text("Sell",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.info_outline, color: Colors.black54),
                  title: Text("About",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.black54),
                  title: Text("Setting",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.black54),
                  title: Text("Logout",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton.icon(onPressed: () {}, icon: Icon(Icons.search),
                label: Text('search'),
              ),

              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Categories',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  )

              ),
              Row(
                children: <Widget>[
                  Column(
                    children: [
                      Image(image: AssetImage('assets/women.png')),
                      Text("Women", style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage('assets/men.png')),
                      Text("Men", style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage('assets/kids.png')),
                      Text("Kids", style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage('assets/bags.png')),
                      Text('Bags&'+'\n'+'shoes', style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage('assets/kitchen.png')),
                      Text("Kitchen", style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage('assets/books.png')),
                      Text("Books", style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text('Deals',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              // Column(
              //   children: quotes.map((quote) => Text(quote)).toList(),
              // )



            ],
//
//

// child: Icon(
// Icons.attach_email_sharp,
// color: Colors.black54,
// ),


// child: Image(
// image: AssetImage('assets/kitchen.png'))


          ),
        ),
      ),
    );
  }
}