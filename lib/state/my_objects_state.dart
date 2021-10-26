import 'package:equatable/equatable.dart';
import 'package:recollar_frontend/models/object.dart';
import 'package:recollar_frontend/models/object_simple.dart';

abstract class MyObjectsState extends Equatable{
  final List<ObjectSimple> objects;
  final Object ? object;
  @override
  List<Object> get props =>[];

  const MyObjectsState(this.objects,this.object);
}
class MyObjectsInitial extends MyObjectsState{

  MyObjectsInitial(): super([],null);
}
class MyObjectsOk extends MyObjectsState{
  const MyObjectsOk(List<ObjectSimple> objects): super(objects,null);
}
class MyObjectsLoading extends MyObjectsState{

  MyObjectsLoading(): super([],null);
}
class MyObjectsSingleOk extends MyObjectsState{

  MyObjectsSingleOk(Object object): super([],object);

}
class MyObjectsFormLoading extends MyObjectsState{

  MyObjectsFormLoading(): super([],null);
}
class MyObjectsGetObjectOk extends MyObjectsState{

  MyObjectsGetObjectOk(Object ? object): super([],object);
}
class MyObjectsForm extends MyObjectsState{
  MyObjectsForm(Object ? object): super([],object);
}