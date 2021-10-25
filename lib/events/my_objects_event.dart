import 'package:equatable/equatable.dart';


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
/*class MyCollectionsInitForm extends MyCollectionsEvent{
  final Collection ? collection;
  MyCollectionsInitForm(this.collection);
}*/
/*
class MyCollectionsAdd extends MyCollectionsEvent{
  final CollectionRequest collectionRequest;
  final XFile imageFile;
  MyCollectionsAdd(this.collectionRequest,this.imageFile);
}*/
