import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recollar_frontend/events/search_event.dart';
import 'package:recollar_frontend/repositories/search_repository.dart';
import 'package:recollar_frontend/state/search_state.dart';


class SearchBloc extends Bloc<SearchEvent,SearchState>{
  final SearchRepository _searchRepository;

  SearchBloc(this._searchRepository):super(SearchInitial());
  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if(event is SearchInitPredict){
      try{
        yield SearchPredictLoading();
        List<String> words=await _searchRepository.predict(event.key);
        yield SearchPredict(words);
      }
      catch(e){
        yield SearchPredictLoading();
      }
    }
    if(event is SearchInit){
      try{
        yield SearchLoading();
        await _searchRepository.getObjects(true,null);
        yield SearchOk(_searchRepository.objects);
      }
      catch(e){
        print(e);
        yield SearchPredictLoading();
      }
    }
    if(event is SearchObjectInit){
      try{
        yield SearchLoading();
        await _searchRepository.getObjectById(event.idObject);
        yield SearchObjectOk(_searchRepository.objects,_searchRepository.object);
      }
      catch(e){
        print(e);
        yield SearchPredictLoading();
      }
    }
    if(event is SearchInitSearch){
      try{
        yield SearchLoading();
        await _searchRepository.getObjects(true,event.key);
        yield SearchOk(_searchRepository.objects);
      }
      catch(e){
        print(e);
        yield SearchPredictLoading();
      }
    }
  }

}