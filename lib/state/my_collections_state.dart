import 'package:equatable/equatable.dart';
import 'package:recollar_frontend/models/collection.dart';

abstract class MyCollectionsState extends Equatable{
  final List<Collection> collections;

  @override
  List<Object> get props =>[];

  const MyCollectionsState(this.collections);
}
class MyCollectionsInitial extends MyCollectionsState{

  MyCollectionsInitial(): super([]);
}
class MyCollectionsOk extends MyCollectionsState{
  const MyCollectionsOk(List<Collection> collections): super(collections);
}
class MyCollectionsLoading extends MyCollectionsState{

  MyCollectionsLoading(): super([]);
}