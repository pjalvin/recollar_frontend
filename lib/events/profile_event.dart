import 'package:equatable/equatable.dart';
import 'package:recollar_frontend/models/profile_request.dart';
import 'package:recollar_frontend/models/user_change_request.dart';


abstract class ProfileEvent extends Equatable{
  @override
  List<Object> get props =>[];

}
class ProfileInit extends ProfileEvent{
  ProfileInit();
}
class ProfileChange extends ProfileEvent{
  final ProfileRequest profileRequest;
  ProfileChange(this.profileRequest);
}
class PasswordChange extends ProfileEvent{
  final UserChangeRequest userChangeRequest;
  PasswordChange(this.userChangeRequest);
}