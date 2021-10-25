import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recollar_frontend/events/my_objects_event.dart';
import 'package:recollar_frontend/repositories/my_objects_repository.dart';
import 'package:recollar_frontend/state/my_objects_state.dart';


class MyObjectsBloc extends Bloc<MyObjectsEvent,MyObjectsState>{
  final MyObjectsRepository _myObjectsRepository;

  MyObjectsBloc(this._myObjectsRepository):super(MyObjectsInitial());
  @override
  Stream<MyObjectsState> mapEventToState(MyObjectsEvent event) async* {
    if(event is MyObjectsSetCollection){
      _myObjectsRepository.idCollection=event.idCollection;
    }
    if(event is MyObjectsInit){
      yield MyObjectsLoading();
      await _myObjectsRepository.getObjects(true);
      yield MyObjectsOk(_myObjectsRepository.objects);
    }
    if(event is MyObjectsGetObject){
      yield MyObjectsFormLoading();
      await _myObjectsRepository.getObjectById(event.idObject);
      yield MyObjectsGetObjectOk(_myObjectsRepository.object);
    }
    if(event is MyObjectsAdd){
      yield MyObjectsFormLoading();
      //await _myObjectsRepository(event.collectionRequest,event.imageFile);
      //await _myCollectionsRepository.getCollections(init: true);
      //yield MyCollectionsOk(_myCollectionsRepository.collections);

    }
    if(event is MyObjectsUpdate){
      yield MyObjectsFormLoading();
      //await _myCollectionsRepository.updateCollection(event.collectionRequest,event.imageFile);
      //await _myCollectionsRepository.getCollections(init: true);
      //yield MyCollectionsOk(_myCollectionsRepository.collections);

    }
    if(event is MyObjectsChangeTools){
      yield MyObjectsLoading();
      _myObjectsRepository.objects[event.index].tools=!_myObjectsRepository.objects[event.index].tools;
      yield MyObjectsOk(_myObjectsRepository.objects);
    }
  }

}