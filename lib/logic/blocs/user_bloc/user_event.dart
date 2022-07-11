part of 'user_bloc.dart';

abstract class UserEvent {}

class UserLogout extends UserEvent {

}

class UpdateUser extends UserEvent {
  final EmployerModel employerModel;
  UpdateUser(this.employerModel);
}

class UpdateUserImage extends UserEvent {
  final String logoPath;
  UpdateUserImage(this.logoPath);
}
