import 'package:equatable/equatable.dart';


abstract class SearchEvent extends Equatable{
  @override
  List<Object> get props =>[];

}
class SearchInitPredict extends SearchEvent{
  String key;
  SearchInitPredict(this.key);
}