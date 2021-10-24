// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recollar_frontend/general_widgets/text_paragraph_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_subtitle_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_title_cpnt.dart';
import 'package:recollar_frontend/util/configuration.dart';

import '../../main.dart';

class DialogCard extends StatelessWidget{
  Object obj;
  DialogCard (this.obj);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: colorWhite,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context){
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top:280,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            color: colorWhite,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: colorBlack,
                blurRadius: 10.0,
                offset: Offset(0.0,0.8),

              )
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextTitleCPNT(colorText: color2, text: "Nombre Objeto", weight: FontWeight.w700),
              SizedBox(height: 16.0),
              TextParagraphCPNT(onPressed: (){}, colorText: maskcolor1, text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TextSubtitleCPNT(colorText: color2, text: "Estado", weight: FontWeight.w700),
                      SizedBox(height: 16.0),
                      Text("9/10",
                        style: TextStyle(
                          color: maskcolor1,
                          fontSize: 16
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      TextSubtitleCPNT(colorText: color2, text: "Precio", weight: FontWeight.w700),
                      SizedBox(height: 16.0),
                      Text("Sin asignar",
                        style: TextStyle(
                            color: maskcolor1,
                            fontSize: 16
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: (){
                    },
                    child: Text("Editar",
                      style: TextStyle(
                        color: colorWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    color: maskcolor1,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: (){
                    },
                    child: Text("Vender",
                      style: TextStyle(
                        color: color2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    color: color1,
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              color: color2,
            ),
            child: Image(
              image: NetworkImage("https://i.colnect.net/f/5762/924/10-Centavos-back.jpg"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
              color: errorcolor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))
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
                    content: TextParagraphCPNT(onPressed: (){}, colorText: color2, text: "¿Desea eliminar este elemento  de la colección?"),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            onPressed: () => Navigator.pop(context),
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
          )
        ),
      ],
    );
  }
}