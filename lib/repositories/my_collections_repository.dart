import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recollar_frontend/models/collection.dart';
import 'package:recollar_frontend/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyCollectionsRepository{

  Future<List<Collection>> getCollections()async{
    List<Collection> _collections=[];
    for(int i=0;i<5;i++){
      _collections.add(Collection(i+1, Colors.primaries[Random().nextInt(Colors.primaries.length)], "Colleccion $i", 1+Random().nextInt(100)));
    }
    return _collections;
  }
  Color getColor(){
    var colors=[const  Color(0xffadff2f),
    const Color(0xff7fff00),
    const Color(0xff7CFC00),
    const Color(0xff00FF00),
    const Color(0xff32CD32),
    const Color(0xff98FB98),
    const Color(0xff90EE90),
    const Color(0xff00FA9A),
    const Color(0xff00FF7F),
    const Color(0xff3CB371),
    const Color(0xff2E8B57),
    const Color(0xff228B22),
    const Color(0xff008000),
    const Color(0xff006400),
    const Color(0xff9ACD32),
    const Color(0xff6B8E23),
    const Color(0xff808000),
    const Color(0xff556B2F),
    const Color(0xff66CDAA),
    const Color(0xff8FBC8B),
    const Color(0xff20B2AA),
    const Color(0xff008B8B),
    const Color(0xff008080)];
    return colors[Random().nextInt(colors.length-1)];
  }

}