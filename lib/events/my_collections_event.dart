import 'package:equatable/equatable.dart';
import 'package:recollar_frontend/models/collection.dart';


abstract class MyCollectionsEvent extends Equatable{
  @override
  List<Object> get props =>[];

}
class MyCollectionsInit extends MyCollectionsEvent{

  MyCollectionsInit();
}
class MyCollectionsInitForm extends MyCollectionsEvent{
  final Collection ? collection;
  MyCollectionsInitForm(this.collection);
}
