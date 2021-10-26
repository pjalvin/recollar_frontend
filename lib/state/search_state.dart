import 'package:equatable/equatable.dart';
import 'package:recollar_frontend/models/object.dart';

abstract class SearchState extends Equatable{
  final List<Object> objects;
  final Object ? object;
  const SearchState(this.objects,this.object);
  @override
  List<Object> get props =>[];

}
class SearchInitial extends SearchState{
  SearchInitial() : super([],null);
}
class SearchPredict extends SearchState{
  final List<String> wordList;
  SearchPredict(this.wordList) : super([],null);
}
class SearchPredictLoading extends SearchState{
  SearchPredictLoading() : super([],null);

}
class SearchLoading extends SearchState{
  SearchLoading() : super([],null);

}
class SearchOk extends SearchState{
  const SearchOk(List<Object> objects):super(objects,null);
}
class SearchObjectOk extends SearchState{
  const SearchObjectOk(List<Object> objects,Object ? object):super(objects,object);
}