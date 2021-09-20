
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
        ButtonIconCPNT(image: images[0],
          size: Size(size.width * 0.3, size.height),
          onPressed: () {
            print("facebook");
          },),
        SizedBox(
          width: size.width * 0.05,
        ),
        ButtonIconCPNT(image: images[1],
          size: Size(size.width * 0.3, size.height),
          onPressed: () {
            print("github");
          },),
        SizedBox(
          width: size.width * 0.05,
        ),
        ButtonIconCPNT(image:images[2],
          size: Size(size.width * 0.3, size.height),
          onPressed: () {
            print("twitter");
          },),
      ],
    );
  }
}
