part of 'user_bloc.dart';

abstract class UserState {
  EmployerModel? employerModel;
  UserState(this.employerModel);
}

class UserInitial extends UserState {
  UserInitial() : super(null);
}
class UserInitiated extends UserState{
  UserInitiated(super.employerModel);
}