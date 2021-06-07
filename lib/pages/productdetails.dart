import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:hotels/bedclass.dart';

class Homedetail extends StatelessWidget {
  final Product hotel;
  const Homedetail({
    Key? key,
    required this.hotel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: "Details".text.black.center.make(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body:ListView(
          children: [
          Container(
          height: 300,
          decoration: BoxDecoration(
            
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(hotel.image)),
            
          ), 
          
          ) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
            "Name  ${hotel.name}".text.bold.make().p12(),
           "Star: ${hotel.star}".text.make(),
            
            ],
            
          ),
          "Location:${hotel.location}".text.make().p12(),
          InkWell(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "This room isn`t avialible".text.make()));
            },
                child: Card(
                
                color: Colors.deepOrange,
                 child: Container(
                 height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child:Center(child: Text("Price-${hotel.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))) ,
                ),
              ),
            ),
            Row(
              children: [
                "Descreption:".text.bold.make().p12()
              ],

            ),
            "-${hotel.dec}".text.make().p2()
          ],
        )
      
    );
  }
}
