import 'package:flutter/material.dart';
import 'package:recollar_frontend/general_widgets/text_paragraph_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_subtitle_cpnt.dart';
import 'package:recollar_frontend/util/configuration.dart';

class SimpleCardCPNT extends StatelessWidget {

  VoidCallback  ?onPressed;
  Color color;
  Color borderColor;
  Color textColor;
  Size size;
  String text;
  String text2;

  SimpleCardCPNT({Key? key,required this.color,required this.borderColor,required this.text2,required this.text,required this.textColor,this.onPressed,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular( size.width*0.05),
                  //#D4D4D5
                ),
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: size.height*0.4,
                      width: size.width,
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.width*0.01),
                      decoration: BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(size.width*0.05) ,bottomRight: Radius.circular(size.width*0.05)),
                        //#D4D4D5
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextSubtitleCPNT(text: text,colorText: textColor,weight: FontWeight.w400),
                            ],
                          ),
                          Row(
                            
                            children: [
                              TextParagraphCPNT(text: text2,colorText: textColor.withOpacity(0.5), onPressed: () {  },),
                            ],
                          )
                        ],
                      )
                    )
                  ],
                )
            ),
            onTap: onPressed
          );
  }
}
