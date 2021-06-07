import 'package:flutter/material.dart';
import 'package:hotels/pages/explorepage.dart';
import 'package:hotels/pages/homepage.dart';
import 'package:hotels/pages/profilepage.dart';


class Bottombar extends StatefulWidget {
  const Bottombar({ Key? key }) : super(key: key);

  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  var select=0;
  final List<Widget> children=[
    Homepage(),
    Explorepage(),
    Profilepage()

  ];
  void selectindex(int index){
    setState(() {
      select=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[select],
      bottomNavigationBar: BottomNavigationBar(
       selectedItemColor: Colors.red,
        onTap: selectindex,
        currentIndex: select,
        items:[
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home)),
            BottomNavigationBarItem(
            label: "Explore",
            icon: Icon(Icons.search)),
            BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person))
        ] ),
    );
  }
}