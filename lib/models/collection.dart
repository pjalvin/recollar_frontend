import 'package:flutter/cupertino.dart';

class Collection{
  int idCollection;
  String image;
  String name;
  int amount;
  String token;

  Collection.fromJson(json,this.token):
        idCollection=json["idCollection"],
        image=json["image"]??"",
        name=json["name"],
        amount=json["amount"];


}