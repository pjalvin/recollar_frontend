class UserAuth{
  String password;
  String email;
  UserAuth(this.password,this.email);

  Map <String,dynamic> toJson()=>{
    "password":password,
    "username":email,
    "grant_type":"password"
  };
  bool verifyData(){
    var ver =true;
    if(password.isEmpty||email.isEmpty){
      ver=false;
    }
    return ver;
  }

}