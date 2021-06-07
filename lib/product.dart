import 'package:flutter/material.dart';
import 'package:hotels/bedclass.dart';


class Item extends StatelessWidget {
  final Product product;

  const Item({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child:ListTile(
        onTap: (){},
        leading: Image.asset(product.image),
        title:Text( product.name,),
        subtitle: Text(product.dec),
        trailing: Text("\$${product.price}}"),
      )
      
    );
  }
}