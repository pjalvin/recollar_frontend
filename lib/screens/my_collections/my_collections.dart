import 'package:flutter/material.dart';
import 'package:recollar_frontend/general_widgets/button_icon_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_title_cpnt.dart';
import 'package:recollar_frontend/util/configuration.dart';

class MyCollections extends StatefulWidget {
  const MyCollections({Key? key}) : super(key: key);

  @override
  _MyCollectionsState createState() => _MyCollectionsState();
}

class _MyCollectionsState extends State<MyCollections>  with AutomaticKeepAliveClientMixin{
  Size sizeP=const Size(1,1);
  @override
  Widget build(BuildContext context) {
    super.build(context);
    sizeP=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorGray,
      body: Stack(
        children: [
          Container(
            color: color2,
          ),
          Container(
            margin: const EdgeInsets.only(top: 110),
            height: sizeP.height-110,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.only(topLeft: Radius.circular(sizeP.width*0.05),topRight: Radius.circular(sizeP.width*0.05)),
              color: colorGray,
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: sizeP.width,
                  height: sizeP.height,
                  child: Center(
                    child: Opacity(
                      opacity: 0.1,
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/logo_black.png",)
                          ),
                        ),
                      ),
                    )
                  ),
                )
              ],
            ),

          ),
          Container(
            height: 110,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,left: sizeP.width*0.05,right: sizeP.width*0.05),
            width: sizeP.width,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ButtonIconCPNT(onPressed: (){}, size: const Size(30,20),icon: Icons.check_box,color: colorWhite),
                            TextTitleCPNT(onPressed: (){}, colorText: colorWhite, text: "Mi Colección"),
                      ],
                    ),
                    ButtonIconCPNT(onPressed: (){}, size: const Size(40,20),icon: Icons.add_circle_outlined,color: color1)
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }

  @override
  bool get wantKeepAlive => true;


}
