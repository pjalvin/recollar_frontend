// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recollar_frontend/general_widgets/text_paragraph_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_subtitle_cpnt.dart';
import 'package:recollar_frontend/util/configuration.dart';

class SimpleCardCPNT extends StatelessWidget {

  VoidCallback  ?onPressed;
  Color color;
  Color colorBg;
  Color textColor;
  Color firstColor;
  Color secondColor;
  Size size;
  String text;
  String text2;
  String image;
  String token;
  String imagePath;
  SimpleCardCPNT({Key? key,required this.imagePath,required this.token,required this.image,required this.color,required this.colorBg,required this.text2,required this.firstColor,required this.secondColor,required this.text,required this.textColor,this.onPressed,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: ShaderMask(
            blendMode: BlendMode.color,
            shaderCallback: (Rect bounds) => LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                this.firstColor,
                this.secondColor,
              ],
            ).createShader(bounds),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image:DecorationImage(
                    image: NetworkImage("http://"+(dotenv.env['API_URL'] ?? "")+"/image/"+image,headers: {"Authorization":"Bearer $token"})
                  ,fit: BoxFit.cover
                ),
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
                        color: colorBg,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(size.width*0.05) ,bottomRight: Radius.circular(size.width*0.05)),
                        //#D4D4D5
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextSubtitleCPNT(text: text,colorText: textColor,weight: FontWeight.w400,maxlines: 1,),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 7),
                                  child: TextParagraphCPNT(text: text2,colorText: textColor.withOpacity(0.5), onPressed: () {  },fontWeight: FontWeight.w600,),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ),
    onTap: onPressed
   );
  }
}
