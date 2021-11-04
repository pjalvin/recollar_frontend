import 'package:recollar_frontend/models/profile_request.dart';
import 'package:recollar_frontend/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recollar_frontend/models/user_change_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfileRepository{
  User user=User("","","",0,"");

  Future<void> profile()async{
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
      user=User.fromJson(jsonDecode(res.body));
    }
  }
  Future<void> updateProfile(ProfileRequest profileRequest)async{
    profileRequest.verifyData();
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String ?token= prefs.getString("token");
    if(token==null){
      throw "No existe token Almacenado";
    }
    var res=await http.put(
      Uri.http(dotenv.env['API_URL'] ?? "", "/user"),
      body: jsonEncode(profileRequest.toJson()),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if(res.statusCode!=200){
      throw "No se pudo modificar el usuario";
    }
    else{
    user.firstName=profileRequest.firstName;
    user.lastName=profileRequest.lastName;
    user.phoneNumber=profileRequest.phoneNumber;}
  }
  Future<void> changePassword(UserChangeRequest userChangeRequest)async{
    userChangeRequest.verifyData();
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String ?token= prefs.getString("token");
    if(token==null){
      throw "No existe token Almacenado";
    }
    var res=await http.put(
      Uri.http(dotenv.env['API_URL'] ?? "", "/user"),
      body: jsonEncode(userChangeRequest.toJson()),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if(res.statusCode!=200){
      throw "No se pudo modificar el usuario";
    }
  }

}