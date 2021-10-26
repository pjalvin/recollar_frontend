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
      await _myObjectsRepository.addObject(event.objectRequest,event.imageFile);
      await _myObjectsRepository.getObjects(true);
      yield MyObjectsOk(_myObjectsRepository.objects);

    }
    if(event is MyObjectsUpdate){
      yield MyObjectsFormLoading();
      await _myObjectsRepository.updateObject(event.object,event.imageFile);
      await _myObjectsRepository.getObjects(true);
      yield MyObjectsOk(_myObjectsRepository.objects);

    }
    if(event is MyObjectsDelete){
      yield MyObjectsFormLoading();
      await _myObjectsRepository.deleteObject(event.idObject);
      await _myObjectsRepository.getObjects(true);
      yield MyObjectsOk(_myObjectsRepository.objects);

    }
    if(event is MyObjectsChangeStatus){
      yield MyObjectsFormLoading();
      await _myObjectsRepository.changeStatus(event.idObject,event.objectStatus);
      await _myObjectsRepository.getObjects(true);
      yield MyObjectsOk(_myObjectsRepository.objects);
    }
    if(event is MyObjectsChangeTools){
      yield MyObjectsLoading();
      _myObjectsRepository.objects[event.index].tools=!_myObjectsRepository.objects[event.index].tools;
      yield MyObjectsOk(_myObjectsRepository.objects);
    }
    if(event is MyObjectsInitForm){
      _myObjectsRepository.object=null;
      yield MyObjectsGetObjectOk(_myObjectsRepository.object);
    }
  }

}