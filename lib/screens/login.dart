import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recollar_frontend/components/button_primary_cpnt.dart';
import 'package:recollar_frontend/components/text_field_primary_cpnt.dart';
import 'package:recollar_frontend/components/text_paragraph_cpnt.dart';
import 'package:recollar_frontend/configuration.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<ImageProvider> backgroundImages=[];
  TextEditingController userTextController= TextEditingController();
  TextEditingController passTextController= TextEditingController();
  Size sizeP=const Size(1,1);
  @override
  void initState() {
    backgroundImages.add(const AssetImage("assets/background/b1.jpg"));
    backgroundImages.add(const AssetImage("assets/background/b2.jpg"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    sizeP=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          carousel(context),
          Container(color: Colors.black.withOpacity(0.7), height: sizeP.height, width: sizeP.width),
          SingleChildScrollView(
            child: SizedBox(
                height: sizeP.height,
                width: sizeP.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("RECOLLAR"),
                      TextFieldPrimaryCPNT(icon:Icons.person,textType: TextInputType.emailAddress,obscureText: false, controller: userTextController, colorBorder: colorWhite, size: Size(sizeP.width*0.7,50), colorBg: Colors.transparent, colorText: colorWhite, hintText: "Correo Electrónico"),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFieldPrimaryCPNT(icon:Icons.lock,textType: TextInputType.text,obscureText: true, controller: passTextController, colorBorder: colorWhite, size: Size(sizeP.width*0.7,50), colorBg: Colors.transparent, colorText: colorWhite, hintText: "Contraseña"),
                      const SizedBox(
                        height: 25,
                      ),
                      ButtonPrimaryCPNT( colorBg: color1, colorText: Colors.black, text: "LOGIN",size: Size(sizeP.width*0.7,50),onPressed:  (){},),
                      const SizedBox(
                        height: 15,
                      ),
                      TextParagraphCPNT(onPressed: (){}, colorText: colorWhite.withOpacity(0.7), text: "¿No tienes una cuenta?"),
                      TextParagraphCPNT(onPressed: (){print("crear");}, colorText: colorWhite, text: "Crear una cuenta"),

                    ],

                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
  Widget carousel(context){
    return Container(
        color: Colors.red,
        height: sizeP.height,
        width: sizeP.width,
        child: CarouselSlider(
          items: backgroundImages.map((e) =>
              Container(
                height: sizeP.height,
                width: sizeP.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: e,
                        fit: BoxFit.cover
                    )
                ),
              )
          ).toList(),
          options: CarouselOptions(
            height: sizeP.height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        )
    );
  }
}
