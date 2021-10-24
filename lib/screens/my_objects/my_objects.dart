import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/src/provider.dart';
import 'package:recollar_frontend/general_widgets/button_icon_cpnt.dart';
import 'dialog_card.dart';
import 'package:recollar_frontend/general_widgets/object_card.dart';
import 'package:recollar_frontend/general_widgets/text_title_cpnt.dart';
import 'package:recollar_frontend/models/collection.dart';
import 'package:recollar_frontend/models/object.dart';
import 'package:recollar_frontend/util/configuration.dart';

class MyObjects extends StatefulWidget{
  Collection col;
  MyObjects (this.col);
  @override
  _MyObjectsState createState() => _MyObjectsState();
}

class _MyObjectsState extends State<MyObjects>{
  Size sizeP=const Size(1,1);
  final ScrollController _scrollController=ScrollController();
  @override
  Widget build(BuildContext context){
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
                  Center(
                      child: Opacity(
                        opacity: 0.1,
                        child: Image.asset("assets/square_logo_black.png",width: sizeP.width*0.6,height: 100,),
                      )
                  ),
                  ClipRRect(
                    borderRadius:  BorderRadius.only(topLeft: Radius.circular(sizeP.width*0.05),topRight: Radius.circular(sizeP.width*0.05)),
                    child: StaggeredGridView.extent(

                      controller:_scrollController,
                      shrinkWrap: true,

                      scrollDirection: Axis.vertical,

                      padding:EdgeInsets.only(left: 10 ,right: 10,top: 10,bottom: 50+sizeP.height*0.02),

                      children: getList([Object(1, 1, "Moneda 10 ctvs", "moneda de 10 centavos", "https://i.colnect.net/f/5762/924/10-Centavos-back.jpg", 1, 9, 0/*, token*/)]),
                      staggeredTiles: getListTile([Object(1, 1, "Moneda 10 ctvs", "moneda de 10 centavos", "https://i.colnect.net/f/5762/924/10-Centavos-back.jpg", 1, 9, 0/*, token*/)]),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      maxCrossAxisExtent: sizeP.width*0.5,
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
                          ButtonIconCPNT.icon(onPressed: (){}, size: const Size(30,20),icon: Icons.import_contacts,color: colorWhite),
                          TextTitleCPNT(onPressed: (){}, colorText: colorWhite, text: widget.col.name,weight: FontWeight.w600,),
                        ],
                      ),
                      ButtonIconCPNT.icon(onPressed: (){
                      },
                      size: const Size(40,20),
                      icon: Icons.add_circle_outlined,
                      color: color1
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
    );
  }

  List<Widget> getList(List<Object> objectList){
    print(objectList);
    List<Widget> list=[];
    var height=150.0;
    for(var i=0;i<objectList.length;i++){
      var obj=objectList[i];
      print(obj.image);
      list.add(ObjectCard(onPressed: (){
        showDialog(context: context, builder: (context) => DialogCard(obj));
      },
        borderColor: color2.withOpacity(0.5),
        textColor: colorWhite,
        size: Size(sizeP.width, sizeP.height*0.3),
        text: obj.name,
        image: obj.image,
        /*imagePath: imagePath*/));
    }
    return list;
  }

  List<StaggeredTile> getListTile(List collectionList){
    List<StaggeredTile> list=[];
    for(var i=0;i<collectionList.length;i++){
      if(i%3==0){
        list.add(const StaggeredTile.fit(1));

      }
      else{

        list.add(const StaggeredTile.fit(1));
      }
    }
    return list;
  }

  
}