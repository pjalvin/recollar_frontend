import 'package:flutter/cupertino.dart';

class Collection{
  int idCollection;
  String image;
  String name;
  int amount;
  String token;
  Color color;

  Collection.fromJson(json,this.token):
        idCollection=json["idCollection"],
        image=json["image"]??"",
        name=json["name"],
        amount=json["amount"],
        color=Color(int.parse("ff"+json["color"], radix: 16));


}