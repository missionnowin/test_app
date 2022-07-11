part of 'user_update_bloc.dart';

abstract class UpdateEvent {}

class UpdateUserEvent extends UpdateEvent {
  EmployerModel employerModel;
  UpdateUserEvent(this.employerModel);
}

class UserUpdateImageEvent extends UpdateEvent{
  String logoPath;
  UserUpdateImageEvent(this.logoPath);
}

class CancelUpdateEvent extends UpdateEvent {

}
