import 'package:equatable/equatable.dart';
import 'package:recollar_frontend/models/object.dart';

abstract class SearchState extends Equatable{
  final List<Object> objects;
  const SearchState(this.objects);
  @override
  List<Object> get props =>[];

}
class SearchInitial extends SearchState{
  SearchInitial() : super([]);
}
class SearchPredict extends SearchState{
  final List<String> wordList;
  SearchPredict(this.wordList) : super([]);
}
class SearchPredictLoading extends SearchState{
  SearchPredictLoading() : super([]);

}
class SearchLoading extends SearchState{
  SearchLoading() : super([]);

}
class SearchOk extends SearchState{
  const SearchOk(List<Object> objects):super(objects);
}