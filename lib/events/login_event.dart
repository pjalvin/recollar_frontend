import 'package:equatable/equatable.dart';
import 'package:recollar_frontend/models/user.dart';
import 'package:recollar_frontend/models/user_auth.dart';

abstract class LoginEvent extends Equatable{
  @override
  List<Object> get props =>[];

}
class LoginClick extends LoginEvent{
  final UserAuth userAuth;
  LoginClick(this.userAuth);
}
class SignupClick extends LoginEvent{
  final User user;
  SignupClick(this.user);
}
class SignupChangePage extends LoginEvent{
  SignupChangePage();
}
class LoginChangePage extends LoginEvent{
  LoginChangePage();
}