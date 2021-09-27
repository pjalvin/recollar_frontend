import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable{

  const SearchState();
  @override
  List<Object> get props =>[];

}
class SearchInitial extends SearchState{

}
class SearchPredict extends SearchState{
  final List<String> wordList;
  const SearchPredict(this.wordList) : super();
}
class SearchPredictLoading extends SearchState{
  const SearchPredictLoading() : super();

}
class SearchLoading extends SearchState{
  const SearchLoading() : super();

}
