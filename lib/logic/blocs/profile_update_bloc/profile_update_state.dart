part of 'profile_update_bloc.dart';

@immutable
abstract class ProfileUpdateState {}

class ProfileUpdateInitial extends ProfileUpdateState {}
class ProFileUpdateSuccess extends ProfileUpdateState {}
class ProfileUpdateError extends ProfileUpdateState {}