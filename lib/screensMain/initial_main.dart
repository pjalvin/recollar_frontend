import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recollar_frontend/bloc/login_bloc.dart';
import 'package:recollar_frontend/repositories/login_repository.dart';
import 'package:recollar_frontend/screens/login/login.dart';
import 'package:recollar_frontend/state/login_state.dart';

class InitialMain extends StatefulWidget {
  const InitialMain({Key? key}) : super(key: key);

  @override
  _InitialMainState createState() => _InitialMainState();
}

class _InitialMainState extends State<InitialMain> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginBloc(LoginRepository()),
      child: BlocBuilder<LoginBloc,LoginState>(
        builder: (BuildContext context, state)
        {
            if(state is LoginOk){
              return const Scaffold(backgroundColor: Colors.black,body: Center(child: Text("INICIO",style: TextStyle(color: Colors.white),),));
            }
            else{
              return const Login();
            }
        },

      ),
    );
  }
}

