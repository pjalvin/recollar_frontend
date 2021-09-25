import 'package:flutter/material.dart';
import 'package:recollar_frontend/util/configuration.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: colorGray,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Profile"),
            TextField()
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;


}
