import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotels/bedclass.dart';
import 'package:hotels/hotelpackages.dart';
import 'package:hotels/popularhotel.dart';
import 'package:hotels/searchbar.dart';
import 'package:velocity_x/velocity_x.dart';
class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final  user =FirebaseAuth.instance.currentUser;
  void initState() {
    
    super.initState();
    loaddata();
  }
  
  loaddata()async{
    
    var jsonfile=await rootBundle.loadString("images/images.json");
    final decode=jsonDecode(jsonfile);
    var hoteldata= decode["images"];
    Bed.product=List.from(hoteldata).map<Product>((product) =>Product.fromMap(product)).toList();
     setState(() {
  
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ${user!.displayName}\nFind your favourite Hotels",style: TextStyle(color: Colors.black),),
        
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(user!.photoURL!),
            backgroundColor: Colors.deepOrange,
          )
        ],
      ),
      body:  Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children:[
                SizedBox(height: 40,),
                  Searchbar(),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Popular hotels:",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    ],
                  ),

                
                Container(
                 margin: EdgeInsets.only(top: 33.6),
                height: 200,
                width: 40,
                  child: Column(
                    children: [
                if(Bed.product!=null && Bed.product.isNotEmpty)
                 Popular().expand()
                 else 
                 Center(child: CircularProgressIndicator()),
                    ]
                  )
                ),
                Row(
                  children: [
                    Text("Hotel Packages:",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: (){}, child: Text("View all"))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 33.6),
                  height: 450,
                width: 20,
                  child: Column(
                  children: [
                    if(Bed.product.isNotEmpty)
                    Hotelpackages().expand()
                    else
                    Center(child: CircularProgressIndicator()),
                  ],

                  ),
                )
               

                
              
          
          ]
        ),
          
      ), 
      
    
        

      
    );
  }
}