import 'package:recollar_frontend/models/user.dart';
import 'package:recollar_frontend/models/user_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginRepository{

  Future login(UserAuth userAuth) async{
    userAuth.verifyData();
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

  Future signup(User user) async{
    user.verifyData();
    var res=await http.post(
        Uri.http(dotenv.env['API_URL'] ?? "", "/user/signup"),
        body: jsonEncode(user.toJson()),
        headers: {
          "Content-Type": "application/json",
          "Authorization": dotenv.env['API_TOKEN'] ?? ""
        },
    );
    if(res.statusCode!=200){
      throw "No se pudo registrar al usuario";
    }

  }

  Future<User> profile()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String ?token= prefs.getString("token");
    if(token==null){
      throw "No existe token Almacenado";
    }
    var res=await http.get(
      Uri.http(dotenv.env['API_URL'] ?? "", "/user"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if(res.statusCode!=200){
      throw "No se pudo obtener el perfil del usuario";
    }
    else{
      var user=User.fromJson(jsonDecode(res.body));
      print(user);
      return user;
    }
  }

}