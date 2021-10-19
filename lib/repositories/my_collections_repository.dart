import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recollar_frontend/models/category.dart';
import 'package:recollar_frontend/models/collection.dart';
import 'package:recollar_frontend/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyCollectionsRepository{
  List<Collection> collections=[];
  List<Category> categories=[];
  Future<void> getCollections({required bool init})async{

    SharedPreferences prefs=await SharedPreferences.getInstance();
    String ?token= prefs.getString("token");
    if(token==null){
      throw "No existe token Almacenado";
    }
    var res=await http.get(
      Uri.http(dotenv.env['API_URL'] ?? "", "/collection"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if(res.statusCode!=200){
      throw "No se pudo obtener el perfil del usuario";
    }
    else{
      if(init){
        collections=[];
      }
      var body = json.decode(utf8.decode(res.bodyBytes));

      for(var col in body){
        collections.add(Collection.fromJson(col, token));
      }
    }
  }
  Future<void> getCategories()async{

    SharedPreferences prefs=await SharedPreferences.getInstance();
    String ?token= prefs.getString("token");
    if(token==null){
      throw "No existe token Almacenado";
    }
    var res=await http.get(
      Uri.http(dotenv.env['API_URL'] ?? "", "/category"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if(res.statusCode!=200){
      throw "No se pudo obtener las categorias";
    }
    else{
      print(res.body);
      categories=[];
      var body = json.decode(utf8.decode(res.bodyBytes));

      for(var cat in body){
        categories.add(Category.fromJson(cat));
      }
    }
  }


}