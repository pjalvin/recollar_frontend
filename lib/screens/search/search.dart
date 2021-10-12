import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recollar_frontend/bloc/search_bloc.dart';
import 'package:recollar_frontend/events/search_event.dart';
import 'package:recollar_frontend/general_widgets/button_icon_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_field_primary_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_paragraph_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_title_cpnt.dart';
import 'package:recollar_frontend/repositories/search_repository.dart';
import 'package:recollar_frontend/state/search_state.dart';
import 'package:recollar_frontend/util/configuration.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search>  with AutomaticKeepAliveClientMixin{
  TextEditingController searchController=TextEditingController();
  FocusNode focus= FocusNode();
  Size sizeP=const Size(1,1);
  bool _searchActive=false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    sizeP=MediaQuery.of(context).size;
    return BlocProvider(
      create:(context)=>SearchBloc(SearchRepository()),
      child: BlocBuilder<SearchBloc,SearchState>(
        builder: (context,state) {
          return Scaffold(
              backgroundColor: colorGray,
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Container(
                    color: colorGray,
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
                                child:  Image.asset("assets/square_logo_black.png",width: sizeP.width*0.6,height: 100,),
                              )
                          ),
                        )
                      ],
                    ),

                  ),
                  _searchActive?Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          _searchCancel();
                        },
                        child: Container(
                          height: sizeP.height,
                          decoration: BoxDecoration(
                            borderRadius:  BorderRadius.only(topLeft: Radius.circular(sizeP.width*0.05),topRight: Radius.circular(sizeP.width*0.05)),
                            color: colorBlack.withOpacity(0.6),
                          ),


                        ),
                      ),
                      state is SearchPredict?
                      SizedBox(
                        height: 40*11,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          padding:  EdgeInsets.only(top: 110,left: (sizeP.width-30)*0.05 ),
                          children: (state is SearchPredict?state.wordList:[""]).map((word){
                            return Column(
                                  children: [
                                    const SizedBox(height: 10,),
                                    SizedBox(
                                      width: sizeP.width-(sizeP.width-30)*0.05,
                                      height: 20,
                                      child: ListView(

                                        children: [
                                          TextParagraphCPNT(
                                              onPressed: (){
                                            setState(() {
                                              searchController.text=word;
                                            });}, colorText: colorWhite, text: word),
                                        ],
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                  ],
                                );
                          }).toList(),
                        ),
                      ):state is SearchPredictLoading?
                      Center(
                        child: SpinKitThreeBounce(
                            color: Colors.white,
                            size: sizeP.width*0.05
                        ),
                      ):Container(),
                    ],
                  ):Container(),
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
                                TextFieldPrimaryCPNT(
                                    onPressed:(){
                                      _searchInit();
                                    },
                                    onFinish:(){
                                      _searchOK();
                                    }
                                    ,onChanged: (key){
                                      context.read<SearchBloc>().add(SearchInitPredict(key));
                                }
                                ,focus:focus,icon: null, textType: TextInputType.text, obscureText: false, controller: searchController, colorBorder: _searchActive?colorWhite:color2, size: Size((sizeP.width-30)*0.8,50), colorBg: _searchActive?colorWhite.withOpacity(0.8):color2.withOpacity(1), colorText: _searchActive?color2:colorWhite, hintText: "Buscar objetos coleccionables")
                              ],
                            ),
                            ButtonIconCPNT.icon(onPressed: (){}, size: const Size(30,20),icon: Icons.search,color: _searchActive?colorWhite:color2)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
          );
        }
      ),
    );
  }

  void _searchInit(){
    setState(() {
      _searchActive=true;
    });

  }
  void _searchCancel(){
    focus.unfocus();
    setState(() {
      _searchActive=false;
    });

  }
  void _searchOK(){
    focus.unfocus();
    setState(() {
      _searchActive=false;
    });

  }

  @override
  bool get wantKeepAlive => true;


}
