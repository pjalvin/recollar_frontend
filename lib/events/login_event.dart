import 'package:equatable/equatable.dart';
import 'package:recollar_frontend/models/user.dart';
import 'package:recollar_frontend/models/user_auth.dart';

abstract class LoginEvent extends Equatable{
  @override
  List<Object> get props =>[];

}
class LoginStart extends LoginEvent{
  final UserAuth userAuth;
  LoginStart(this.userAuth) ;
}
class SignUpStart extends LoginEvent{
  final User user;
  SignUpStart(this.user);
}