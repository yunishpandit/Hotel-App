import 'package:flutter/material.dart';
import 'package:hotels/bedclass.dart';
import 'package:hotels/pages/productdetails.dart';
import 'package:velocity_x/velocity_x.dart';
class Hotelpackages extends StatefulWidget {
  const Hotelpackages({ Key? key }) : super(key: key);

  @override
  _HotelpackagesState createState() => _HotelpackagesState();
}

class _HotelpackagesState extends State<Hotelpackages> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
        child: Row(
          children: [
         Hero(tag: Key(hotel.name.toString()),
         
          child: Image.asset(hotel.image,height: 100,width: 100,)),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            hotel.name.text.bold.make().p12(),
           "Location:${ hotel.location}".text.make().p12(),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
                hotel.star.text.make()
             ],
           )
            ],
          ))

          ],
        ),
      ),
    );
  }
}
    