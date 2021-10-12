import 'package:equatable/equatable.dart';


abstract class MyCollectionsEvent extends Equatable{
  @override
  List<Object> get props =>[];

}
class MyCollectionsInit extends MyCollectionsEvent{

  MyCollectionsInit();
}
