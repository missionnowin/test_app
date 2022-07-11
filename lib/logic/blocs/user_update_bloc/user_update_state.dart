part of 'user_update_bloc.dart';

abstract class UserUpdateState {
  EmployerModel? employerModel;
  UserUpdateState(this.employerModel);
}

class UserUpdateInitial extends UserUpdateState {
  UserUpdateInitial(super.employerModel);

}
class UserUpToDateState extends UserUpdateState {
  UserUpToDateState(super.employerModel);

}
class UserCancelState extends UserUpdateState {
  UserCancelState() : super(null);
}