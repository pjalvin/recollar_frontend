import 'package:flutter/material.dart';
import 'package:recollar_frontend/util/configuration.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: colorGray,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Search"),
            TextField()
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;


}
