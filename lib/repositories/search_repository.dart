import 'package:recollar_frontend/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SearchRepository{

  Future<List<String>> predict(String key)async{
    if(key.length<2){
      throw "LLave muy corta";
    }
    var res=await http.get(
      Uri.http("google.com", "/complete/search",{"client":"chrome","q":key}),
    );
    if(res.statusCode!=200){
      throw "No se pudo hacer la predicción";
    }
    else{
      List<String> listWords=[];
      List words=jsonDecode(res.body);
      words[1].forEach((key){
        listWords.add(key);
      });
      return listWords;
    }
  }

}