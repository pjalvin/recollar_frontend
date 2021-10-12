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
      var list=await _myCollectionsRepository.getCollections();
      yield MyCollectionsOk(list);
    }
  }

}