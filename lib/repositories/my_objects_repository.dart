import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recollar_frontend/models/object.dart';
import 'package:recollar_frontend/models/object_simple.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyObjectsRepository{
  List<ObjectSimple> objects=[];
  int idCollection=0;
  Object ? object;

  Future<void> getObjects(bool init )async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ?token = prefs.getString("token");
    if (token == null) {
      throw "No existe token Almacenado";
    }
    var res = await http.get(
      Uri.http(dotenv.env['API_URL'] ?? "", "/object",{"id_collection":idCollection.toString()}),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (res.statusCode != 200) {
      throw "No se pudo obtener los objetos";
    }
    else {
      if (init) {
        objects = [];
      }
      var body = json.decode(utf8.decode(res.bodyBytes));

      for (var obj in body) {
        objects.add(ObjectSimple.fromJson(obj, token));
      }
    }
  }
  Future<void> getObjectById(int idObject)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ?token = prefs.getString("token");
    if (token == null) {
      throw "No existe token Almacenado";
    }
    var res = await http.get(
      Uri.http(dotenv.env['API_URL'] ?? "", "/object/$idObject",),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (res.statusCode != 200) {
      throw "No se pudo obtener el objeto";
    }
    else {
      var body = res.body;

      object=Object.fromJson(jsonDecode(body),token);
    }
  }

}