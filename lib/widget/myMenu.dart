import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
            child: Row(
              children: [
                Text('vid 13 min 12:45'),
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                  child: Container(
                    height: 140.0,
                    width: 140.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/circleAvatar.png'),
                     // radius: 40.0,

                    )
                  )
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
