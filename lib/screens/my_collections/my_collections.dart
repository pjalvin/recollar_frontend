import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recollar_frontend/bloc/my_collections_bloc.dart';
import 'package:recollar_frontend/events/my_collections_event.dart';
import 'package:recollar_frontend/general_widgets/button_icon_cpnt.dart';
import 'package:recollar_frontend/general_widgets/simple_card_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_title_cpnt.dart';
import 'package:recollar_frontend/models/collection.dart';
import 'package:recollar_frontend/repositories/my_collections_repository.dart';
import 'package:recollar_frontend/screens/my_collections/collection_form.dart';
import 'package:recollar_frontend/state/my_collections_state.dart';
import 'package:recollar_frontend/util/configuration.dart';
import 'package:image_picker/image_picker.dart';
class MyCollections extends StatefulWidget {
  const MyCollections({Key? key}) : super(key: key);

  @override
  _MyCollectionsState createState() => _MyCollectionsState();
}

class _MyCollectionsState extends State<MyCollections>  with AutomaticKeepAliveClientMixin{
  Size sizeP=const Size(1,1);
  final ScrollController _scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    sizeP=MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>MyCollectionsBloc(MyCollectionsRepository())..add(MyCollectionsInit()),
      child: BlocBuilder<MyCollectionsBloc,MyCollectionsState>(
        builder: (context,state) {
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

                          children: getList(state.collections),
                          staggeredTiles: getListTile(state.collections),
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
                              ButtonIconCPNT.icon(onPressed: (){}, size: const Size(30,20),icon: Icons.fact_check,color: colorWhite),
                                  TextTitleCPNT(onPressed: (){}, colorText: colorWhite, text: "Mi Colección",weight: FontWeight.w600,),
                            ],
                          ),
                          ButtonIconCPNT.icon(onPressed: (){
                            addCollection(context);
                          }, size: const Size(40,20),icon: Icons.add_circle_outlined,color: color1)
                        ],
                      )
                    ],
                  ),
                ),

              ],
            )
          );
        }
      ),
    );
  }

  List<Widget> getList(List<Collection> collectionList){
    List<Widget> list=[];
    var height=150.0;
    for(var i=0;i<collectionList.length;i++){
      var col=collectionList[i];
      print(col.color);
      if(i%3==0) {
        list.add(SimpleCardCPNT(color: col.color,
            borderColor: color2.withOpacity(0.5),
            text: col.name,
            text2: "Artículos: ${col.amount}",
            textColor: color2,
            size: Size(sizeP.width, height),
            image: col.image,
            token:col.token,
            imagePath: "imageCollection",));
      }
      else{
        list.add(SimpleCardCPNT(color: col.color,
            borderColor: color2.withOpacity(0.5),
            text: col.name,
            text2: "Artículos: ${col.amount}",
            textColor: color2,
            size: Size(sizeP.width, height),
            image: col.image,
            token:col.token,
            imagePath: "imageCollection"
        ),
        );

      }
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
  void addCollection(BuildContext context){
    context.read<MyCollectionsBloc>().add(MyCollectionsInitForm(null));
    Navigator.push(context, MaterialPageRoute(builder: (_)=>
    BlocProvider.value(
      value: BlocProvider.of<MyCollectionsBloc>(context),
      child: const CollectionForm(),
    )));
  }

  @override
  bool get wantKeepAlive => true;

}
