import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recollar_frontend/bloc/profile_bloc.dart';
import 'package:recollar_frontend/events/profile_event.dart';
import 'package:recollar_frontend/general_widgets/button_primary_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_field_primary_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_paragraph_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_subtitle_cpnt.dart';
import 'package:recollar_frontend/general_widgets/text_title_cpnt.dart';
import 'package:recollar_frontend/repositories/profile_repository.dart';
import 'package:recollar_frontend/state/profile_state.dart';
import 'package:recollar_frontend/util/configuration.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>  with AutomaticKeepAliveClientMixin{
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  Size sizeP=const Size(1,1);
  @override
  Widget build(BuildContext context) {
    sizeP=MediaQuery.of(context).size;
    super.build(context);
    return  BlocProvider(
        create: (context)=>ProfileBloc(ProfileRepository())..add(ProfileInit()),
      child: BlocBuilder<ProfileBloc,ProfileState>(
        builder: (context,state){
          if(state is ProfileOk){
            firstNameController.text=state.user.firstName;
            lastNameController.text=state.user.lastName;
            phoneNumberController.text=state.user.phoneNumber.toString();
          }
          return Scaffold(
            backgroundColor: colorGray,

            body: ListView(
              padding: const EdgeInsets.only(top:100),
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    ClipRRect(

                      child: Image(image:state.user.imagePath!=null&&state.user.imagePath!=""?NetworkImage(state.user.imagePath??"") as ImageProvider:const AssetImage("assets/const/profile.png"),fit:BoxFit.cover,width: 150,height: 150,),
                      borderRadius:  BorderRadius.circular(sizeP.width*0.25),

                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    TextTitleCPNT(onPressed: (){}, colorText: color2, text: state.user.firstName+" "+state.user.lastName, weight: FontWeight.w700)
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    TextParagraphCPNT(onPressed: (){}, colorText: colorBlack.withOpacity(0.3), text: state.user.email)
                  ],
                ),
                const SizedBox(height: 40,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizeP.width*0.15),
                    child:
                    TextSubtitleCPNT(onPressed: (){}, colorText: color2.withOpacity(0.7), text: "Nombre(s)", weight: FontWeight.w200)

                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    TextFieldPrimaryCPNT(onPressed:(){},icon: null, textType: TextInputType.text, obscureText: false, controller: firstNameController, colorBorder: colorWhite, size: Size(sizeP.width*0.7,50), colorBg: colorWhite, colorText: color2, hintText: state.user.firstName),
                  ],
                ),
                const SizedBox(height: 15,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizeP.width*0.15),
                    child:
                    TextSubtitleCPNT(onPressed: (){}, colorText: color2.withOpacity(0.7), text: "Apellido(s)", weight: FontWeight.w200)

                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    TextFieldPrimaryCPNT(onPressed:(){},icon: null, textType: TextInputType.text, obscureText: false, controller: lastNameController, colorBorder: colorWhite, size: Size(sizeP.width*0.7,50), colorBg: colorWhite, colorText: color2, hintText: state.user.lastName),
                  ],
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizeP.width*0.15),
                  child:
                    TextSubtitleCPNT(onPressed: (){}, colorText: color2.withOpacity(0.7), text: "Numero de celular", weight: FontWeight.w200)
                  
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    TextFieldPrimaryCPNT(onPressed:(){},icon: null, textType: TextInputType.number, obscureText: false, controller: phoneNumberController, colorBorder: colorWhite, size: Size(sizeP.width*0.7,50), colorBg: colorWhite, colorText: color2, hintText: state.user.phoneNumber.toString()),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizeP.width*0.1),
                  child: Divider(
                    color: color2,
                      height: 60,
                  ),
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    TextSubtitleCPNT(onPressed: (){},  colorText: color2, text: "Política de privacidad",weight: FontWeight.w200,),
                    Icon(Icons.arrow_right,color: color2,)
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    ButtonPrimaryCPNT( elevation: 0,colorBg: color2, colorText: colorWhite, text: "Cerrar Sesión",size: Size(sizeP.width*0.5,50),
                      onPressed:  (){
                      },
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;


}
