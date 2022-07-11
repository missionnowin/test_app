part of 'user_update_bloc.dart';

abstract class UserUpdateEvent {}
class UpdateUserEvent extends UserUpdateEvent {}
class CancelUpdateEvent extends UserUpdateEvent {}
