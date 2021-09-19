import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextParagraphCPNT extends StatelessWidget {
  VoidCallback  onPressed;
  Color colorText;
  String text;
  TextParagraphCPNT({Key? key,required this.onPressed,required this.colorText,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Text(text,style: TextStyle(color: colorText,fontSize: 14),),

      );
  }
}

