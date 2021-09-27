import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recollar_frontend/events/search_event.dart';
import 'package:recollar_frontend/repositories/search_repository.dart';
import 'package:recollar_frontend/state/search_state.dart';


class SearchBloc extends Bloc<SearchEvent,SearchState>{
  final SearchRepository _profileRepository;

  SearchBloc(this._profileRepository):super(SearchInitial());
  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if(event is SearchInitPredict){
      try{
        yield const SearchPredictLoading();
        List<String> words=await _profileRepository.predict(event.key);
        yield SearchPredict(words);
      }
      catch(e){
        yield const SearchPredictLoading();
      }
    }
  }

}