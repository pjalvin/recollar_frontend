// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recollar_frontend/general_widgets/text_paragraph_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_subtitle_cpnt.dart';
import 'package:recollar_frontend/util/configuration.dart';

class SimpleCardCPNT extends StatelessWidget {

  VoidCallback  ?onPressed;
  Color color;
  Color borderColor;
  Color textColor;
  Color firstColor;
  Color secondColor;
  Size size;
  String text;
  String text2;
  String image;
  String token;
  String imagePath;
  SimpleCardCPNT({Key? key,required this.imagePath,required this.token,required this.image,required this.color,required this.borderColor,required this.text2,required this.firstColor,required this.secondColor,required this.text,required this.textColor,this.onPressed,required this.size}) : super(key: key);

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
                borderRadius: BorderRadius.circular( size.width*0.05),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: color2,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                        ),
                        child: IconButton(
                          icon: Icon(
                              Icons.delete
                          ),
                          iconSize: 30,
                          color: colorWhite,
                          onPressed: () {
                            showDialog(context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly
                                      ,children: [
                                      TextSubtitleCPNT(colorText: color2, text: "Confirmar eliminación", weight: FontWeight.w700),
                                      Icon(
                                        Icons.announcement,
                                        color: errorcolor,
                                        size: 25,
                                      ),
                                    ],
                                    ),
                                    content: TextParagraphCPNT(onPressed: (){}, colorText: color2, text: "¿Desea eliminar esta colección?"),
                                    actions: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FlatButton(
                                            onPressed: (){},
                                            child: Text("Cancelar",
                                              style: TextStyle(
                                                color: colorWhite,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            color: color2,
                                          ),
                                          FlatButton(
                                            onPressed: (){},
                                            child: Text("Eliminar",
                                              style: TextStyle(
                                                color: colorWhite,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            color: errorcolor,
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: TextSubtitleCPNT(text: text,colorText: textColor,weight: FontWeight.w400),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 7),
                                child: TextParagraphCPNT(text: text2,colorText: textColor.withOpacity(0.5), onPressed: () {  },),
                              ),
                            ],
                          )
                        ],
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
