import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recollar_frontend/bloc/login_bloc.dart';
import 'package:recollar_frontend/events/login_event.dart';
import 'package:recollar_frontend/repositories/login_repository.dart';
import 'package:recollar_frontend/screens/login/login.dart';
import 'package:recollar_frontend/screens/signup/signup.dart';
import 'package:recollar_frontend/state/login_state.dart';

import 'app_main.dart';

class InitialMain extends StatefulWidget {
  const InitialMain({Key? key}) : super(key: key);

  @override
  _InitialMainState createState() => _InitialMainState();
}

class _InitialMainState extends State<InitialMain> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginBloc(LoginRepository())..add(LoginVerify()),
      child: BlocBuilder<LoginBloc,LoginState>(
        builder: (BuildContext context, state)
        {
            if(state is LoginOk){
              return AppMain();
            }
            if(state is SignupPage||state is SignupLoading){
              return const Signup();
            }
            if(state is LoginInitial){
              return Container(color: Colors.red,);
            }
            else{
              return const Login();
            }
        },

      ),
    );
  }
}

