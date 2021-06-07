import 'package:flutter/material.dart';
import 'package:hotels/bedclass.dart';
import 'package:hotels/pages/productdetails.dart';
import 'package:velocity_x/velocity_x.dart';
class Popular extends StatefulWidget {
  const Popular({ Key? key }) : super(key: key);

  @override
  _PopularState createState() => _PopularState();
}


class _PopularState extends State<Popular> {
  
  @override
  Widget build(BuildContext context) {
    return  
      ListView.builder(
        physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: Bed.product.length,
      itemBuilder:(context, index) {
        final hotel=Bed.product[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Homedetail(hotel: hotel)));
          },
          child: Popularhotel(hotel: hotel,));
      },
      
    );
  }
}

class Popularhotel extends StatelessWidget {
  final Product hotel;

  const Popularhotel({Key? key, required this.hotel}) :assert(hotel!=null), super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Image.asset(hotel.image,height: 100,width: 100,),
           Column(
             children:[
           "Name:${hotel.name}".text.bold.make(),
           SizedBox(width: 10,),
           "Location:${hotel.location}".text.bold.make(),
           "Star:${hotel.star}".text.make()
             ]
           )
         ],
       ),
      
    );
  }
}