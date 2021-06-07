import 'package:flutter/material.dart';
import 'package:hotels/bedclass.dart';
import 'package:hotels/hotelpackages.dart';
import 'package:hotels/popularhotel.dart';
import 'package:velocity_x/velocity_x.dart';
class Explorepage extends StatelessWidget {
  const Explorepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
         backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 40,),
            Card(
              elevation: 4,
               child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                icon: Icon(Icons.search),
                
                ),
                
              ),
            ),
            SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                     Container(
                       decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1
                          
                        ),
                        borderRadius: BorderRadius.circular(10)
                       ),
                       child: Row(
                         children: [
                           Icon(Icons.cancel),
                           Text("Best hotel")
                         ],
                       )
                     ),
                     SizedBox(width: 20,),
                     Container(
                       decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1
                          
                        ),
                        borderRadius: BorderRadius.circular(10)
                       ),
                       child: Row(
                         children: [
                           Icon(Icons.cancel),
                           Text(" Hotel")
                         ],
                       )
                     ),
                     SizedBox(width: 20,),
                     Container(
                       decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1
                          
                        ),
                        borderRadius: BorderRadius.circular(10)
                       ),
                       child: Row(
                         children: [
                           Icon(Icons.cancel),
                           Text("Cheap hotel")
                         ],
                       )
                     ),
                    
                  ],
                ),
           SizedBox(height: 30,),
           Text("Most Search:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
          ],
        ),
      ),
    );
  }
}