import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldPrimaryCPNT extends StatelessWidget {
  TextEditingController controller;
  Size size;
  Color colorBg;
  Color colorBorder;
  Color colorText;
  String hintText;
  bool obscureText;
  IconData icon;
  TextInputType textType;
  TextFieldPrimaryCPNT({Key? key,required this.icon,required this.textType,required this.obscureText,required this.controller,required this.colorBorder,required this.size,required this.colorBg,required this.colorText,required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: size.width,
      height: size.height,
      child:TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: textType,
          decoration: InputDecoration(
            prefixIcon: Icon(icon,color:colorText) ,
            fillColor: colorBg,

            filled: true,
            focusColor: colorBg,
            contentPadding: const EdgeInsets.only(left: 0,right: 10),
              focusedBorder: OutlineInputBorder(

                borderSide: BorderSide(color: colorBorder, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorBorder.withOpacity(0.7), width: 1),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: colorText.withOpacity(0.5)),
              border: OutlineInputBorder(borderSide: BorderSide(color: colorBorder,width: 1))),
          style: TextStyle(color: colorText),
          cursorColor: colorText,



        ),
    );
  }
}

