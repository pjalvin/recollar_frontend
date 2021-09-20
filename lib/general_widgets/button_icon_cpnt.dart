
import 'package:flutter/material.dart';
class ButtonIconCPNT extends StatelessWidget {
  ImageProvider  image;
  VoidCallback  onPressed;
  Size size;
  ButtonIconCPNT({Key? key,required this.image,required this.onPressed,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      padding: EdgeInsets.zero,
      icon: Image(image:image,width: size.width,height: size.height,),
      onPressed: onPressed,

    );
  }
}

