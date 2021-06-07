import 'dart:convert';

class Bed{
  static List<Product>product=[
  
  ];

  

}


class Product {

String name;
String price;
String image;
String location;
String dec;
String star;
  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.location,
    required this.dec,
    required this.star,
  });




  Product copyWith({
    String? name,
    String? price,
    String? image,
    String? location,
    String? dec,
    String? star,
  }) {
    return Product(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      location: location ?? this.location,
      dec: dec ?? this.dec,
      star: star ?? this.star,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'location': location,
      'dec': dec,
      'star': star,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      price: map['price'],
      image: map['image'],
      location: map['location'],
      dec: map['dec'],
      star: map['star'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(name: $name, price: $price, image: $image, location: $location, dec: $dec, star: $star)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.name == name &&
      other.price == price &&
      other.image == image &&
      other.location == location &&
      other.dec == dec &&
      other.star == star;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      price.hashCode ^
      image.hashCode ^
      location.hashCode ^
      dec.hashCode ^
      star.hashCode;
  }
}
