import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recollar_frontend/models/object.dart';
import 'package:recollar_frontend/models/object_request.dart';


abstract class MyObjectsEvent extends Equatable{
  @override
  List<Object> get props =>[];

}
class MyObjectsInit extends MyObjectsEvent{
  MyObjectsInit();
}
class MyObjectsSetCollection extends MyObjectsEvent{
  int idCollection;
  MyObjectsSetCollection(this.idCollection);
}
class MyObjectsGetObject extends MyObjectsEvent{
  int idObject;
  MyObjectsGetObject(this.idObject);
}
class MyObjectsChangeTools extends MyObjectsEvent{
  final int index;
  MyObjectsChangeTools(this.index);
}
class MyObjectsInitForm extends MyObjectsEvent{
  final Object ? object;
  MyObjectsInitForm(this.object);
}
class MyObjectsAdd extends MyObjectsEvent{
  final ObjectRequest objectRequest;
  final XFile imageFile;
  MyObjectsAdd(this.objectRequest,this.imageFile);
}
class MyObjectsUpdate extends MyObjectsEvent{
  final Object object;
  final XFile imageFile;
  MyObjectsUpdate(this.object, this.imageFile);
}
