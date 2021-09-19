import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonPrimaryCPNT extends StatelessWidget {
  VoidCallback  onPressed;
  Size size;
  Color colorBg;
  Color colorText;
  String text;
 ButtonPrimaryCPNT({Key? key,required this.onPressed,required this.size,required this.colorBg,required this.colorText,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
          height: size.height,
          minWidth:size.width,
          onPressed: onPressed,
          color: colorBg,
          child: Center(
            child: Text(text,style: TextStyle(color: colorText,fontSize: 18),),
          ),

        );
  }
}

