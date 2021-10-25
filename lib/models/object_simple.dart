

class ObjectSimple{
  int idObject;
  String image;
  String name;
  String token;
  bool tools=false;

ObjectSimple.fromJson(json,this.token):
        idObject=json["idObject"],
        name=json["name"],
        image=json["image"];
}