import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recollar_frontend/events/login_event.dart';
import 'package:recollar_frontend/repositories/login_repository.dart';
import 'package:recollar_frontend/state/login_state.dart';
import 'package:recollar_frontend/util/toast_lib.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginRepository loginRepository;

  LoginBloc(this.loginRepository):super(LoginInitial());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginStart){
      try{
        yield LoginLoading();
        await loginRepository.login(event.userAuth);
        yield LoginOk(event.userAuth);
      }
      on SocketException catch(_){
        ToastLib.error("No se puede conectar con el Servidor");
        yield LoginFailed(event.userAuth);

      }
      catch(e){
        ToastLib.error(e.toString());
        yield LoginFailed(event.userAuth);
      }
    }
  }

}