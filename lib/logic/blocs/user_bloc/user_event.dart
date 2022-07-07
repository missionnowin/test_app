part of 'user_bloc.dart';

abstract class UserEvent {}

class UserLogout extends UserEvent {}

class UpdateUser extends UserEvent {
  final EmployerUpdateModel user;
  UpdateUser(this.user);
}

class UpdateUserImage extends UserEvent {
  final String imagePath;
  UpdateUserImage(this.imagePath);
}
