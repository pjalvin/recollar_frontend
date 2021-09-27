
import 'package:flutter/material.dart';
import 'package:recollar_frontend/general_widgets/button_icon_cpnt.dart';


class SocialMedia extends StatelessWidget {
  SocialMedia({Key? key, required this.size,required this.images}) : super(key: key);
  Size size;
  List<ImageProvider> images;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonIconCPNT.image(image: images[0],
          size: Size(size.width * 0.3, size.height),
          onPressed: () {
            //TODO implementar url pagina
            print("facebook");
          },),
        SizedBox(
          width: size.width * 0.05,
        ),
        ButtonIconCPNT.image(image: images[1],
          size: Size(size.width * 0.3, size.height),
          onPressed: () {
            //TODO implementar url pagina
            print("github");
          },),
        SizedBox(
          width: size.width * 0.05,
        ),
        ButtonIconCPNT.image(image:images[2],
          size: Size(size.width * 0.3, size.height),
          onPressed: () {
          //TODO implementar url pagina
            print("twitter");
          },),
      ],
    );
  }
}
