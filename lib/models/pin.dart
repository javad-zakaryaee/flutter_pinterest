// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pin {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  double rating;
  int rateCount;
  Pin({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.rateCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating,
      'rateCount': rateCount,
    };
  }

  factory Pin.fromMap(Map<String, dynamic> map) {
    return Pin(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as double,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      rating: map['rating']['rate'] as double,
      rateCount: map['rating']['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pin.fromJson(String source) =>
      Pin.fromMap(json.decode(source) as Map<String, dynamic>);
}
