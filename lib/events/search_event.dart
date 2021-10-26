import 'package:equatable/equatable.dart';


abstract class SearchEvent extends Equatable{
  @override
  List<Object> get props =>[];

}
class SearchInitPredict extends SearchEvent{
  final String key;
  SearchInitPredict(this.key);
}

class SearchInit extends SearchEvent{
  SearchInit();
}