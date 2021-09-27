import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recollar_frontend/events/login_event.dart';
import 'package:recollar_frontend/events/profile_event.dart';
import 'package:recollar_frontend/models/user.dart';
import 'package:recollar_frontend/models/user_auth.dart';
import 'package:recollar_frontend/repositories/login_repository.dart';
import 'package:recollar_frontend/repositories/profile_repository.dart';
import 'package:recollar_frontend/state/login_state.dart';
import 'package:recollar_frontend/state/profile_state.dart';
import 'package:recollar_frontend/util/toast_lib.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  final ProfileRepository _profileRepository;

  ProfileBloc(this._profileRepository):super(ProfileInitial());
  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if(event is ProfileInit){
      try{
        yield ProfileLoading();
        User user=await _profileRepository.profile();
        yield ProfileOk(user);
      }
      catch (e){
        yield ProfileLoading();
      }
    }
  }

}