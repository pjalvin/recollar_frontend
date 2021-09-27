import 'package:equatable/equatable.dart';
import 'package:recollar_frontend/models/user.dart';

abstract class ProfileState extends Equatable{
  final User user;
  const ProfileState(this.user);
  @override
  List<Object> get props =>[user];

}
class ProfileInitial extends ProfileState{
  ProfileInitial() : super(User("","","",0,""));
}
class ProfileOk extends ProfileState{
  const ProfileOk(User user) : super(user);
}
class ProfileLoading extends ProfileState{
  ProfileLoading() : super(User("","","",0,""));

}