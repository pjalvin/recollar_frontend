
import 'package:flutter/material.dart';
class ButtonIconCPNT extends StatelessWidget {
  ImageProvider  ?image;
  IconData ?icon;
  VoidCallback  onPressed;
  Size size;
  Color ?color;
  ButtonIconCPNT({Key? key,this.image,required this.onPressed, required this.size ,this.icon,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      padding: EdgeInsets.zero,
      icon: image!=null?Image(image:image??const AssetImage("assets/icons/fb.png"),width: size.width,height: size.height,):Icon(icon,size: size.width,),
      onPressed: onPressed,
      color: color,

    );
  }
}

