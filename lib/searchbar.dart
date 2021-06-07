import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class Searchbar extends StatelessWidget {
  const Searchbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
            elevation: 10,
             child: TextField(
               
              decoration: InputDecoration(
                focusColor: Colors.white,
                border:InputBorder.none ,
                icon: Icon(Icons.search).p12(),
                hintText: "Search"
                
              ),
             
            ) ,
          );
  }
}