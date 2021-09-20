import 'package:recollar_frontend/models/user_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginRepository{

  Future login(UserAuth userAuth) async{
    if(userAuth.verifyData()){
      String url="${dotenv.env['API_URL']}/login";
      print(url);
      var res=await http.post(
          Uri.http(dotenv.env['API_URL'] ?? "", "/login"),
          body: userAuth.toJson(),

          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": dotenv.env['API_TOKEN'] ?? ""
          },
          encoding: Encoding.getByName("utf-8")
      );
      if(res.statusCode!=200){
        throw "Correo electrónico o contraseña incorrectos";
      }
      var body=jsonDecode(res.body);
      SharedPreferences prefs=await SharedPreferences.getInstance();
      await prefs.setString("token", body["access_token"] ?? "");
    }
    else{
      throw "Verifique los datos";
    }
  }
}