import 'package:flutter/cupertino.dart';

class Object{
  int idObject;
  int idCollection;
  String name;
  String description;
  String image;
  int status;
  int objectStatus;
  double price;
  String token;



  Object.fromJson(json,this.token):
        idObject=json["idObject"],
        idCollection=json["idCollection"],
        name=json["name"],
        description=json["description"],
        image=json["image"],
        status=json["status"],
        objectStatus=json["objectStatus"],
        price=json["price"];
}