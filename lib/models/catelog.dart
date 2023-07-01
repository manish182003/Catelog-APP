import 'package:flutter/cupertino.dart';

class Catelogmodel {
  static List<Item> items = [];

  Item getbyid(int id) =>
      items.firstWhere((Element) => Element.id == id, orElse: null);

      
 Item getbyposition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        image: map["image"],
        color: map["color"],
        price: map["price"]);
  }

  tomap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
