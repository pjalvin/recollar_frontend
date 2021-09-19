import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonIconCPNT extends StatelessWidget {
  String  image;
  VoidCallback  onPressed;
  Size size;
  ButtonIconCPNT({Key? key,required this.image,required this.onPressed,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      padding: EdgeInsets.zero,
      icon: Image.asset(image,width: size.width),
      onPressed: onPressed,

    );
  }
}

