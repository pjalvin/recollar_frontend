import 'package:flutter/cupertino.dart';
import 'package:recollar_frontend/models/combo_box_item.dart';

class ObjectForm extends StatefulWidget{
  @override
  _ObjectFormState createState() => _ObjectFormState();
}

class _ObjectFormState extends State<ObjectForm>{
  TextEditingController nameController=TextEditingController();
  ComboBoxItem comboBoxItem=ComboBoxItem(null, null);
  List<ComboBoxItem> items=[];
  Size sizeP=const Size(1,1);

  @override
  Widget build(BuildContext context) {
    sizeP=MediaQuery.of(context).size;
    return Container();
  }
}