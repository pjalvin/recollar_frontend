import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recollar_frontend/events/my_collections_event.dart';
import 'package:recollar_frontend/repositories/my_collections_repository.dart';
import 'package:recollar_frontend/state/my_collections_state.dart';


class MyCollectionsBloc extends Bloc<MyCollectionsEvent,MyCollectionsState>{
  final MyCollectionsRepository _myCollectionsRepository;

  MyCollectionsBloc(this._myCollectionsRepository):super(MyCollectionsInitial());
  @override
  Stream<MyCollectionsState> mapEventToState(MyCollectionsEvent event) async* {
    if(event is MyCollectionsInit){
      yield MyCollectionsLoading();
      await _myCollectionsRepository.getCollections(init: true);
      yield MyCollectionsOk(_myCollectionsRepository.collections);
    }
    if(event is MyCollectionsInitForm){
      yield MyCollectionsLoadingForm();
      await _myCollectionsRepository.getCategories();
      var categories=_myCollectionsRepository.categories;
      yield MyCollectionsForm(categories, event.collection);
    }
    if(event is MyCollectionsAdd){
      yield MyCollectionsLoadingForm();
      await _myCollectionsRepository.addCollection(event.collectionRequest,event.imageFile);
      await _myCollectionsRepository.getCollections(init: true);
      yield MyCollectionsOk(_myCollectionsRepository.collections);

    }
  }

}