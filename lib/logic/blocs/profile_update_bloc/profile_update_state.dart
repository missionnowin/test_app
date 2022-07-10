part of 'profile_update_bloc.dart';

abstract class ProfileUpdateState {}

class ProfileUpdateInitial extends ProfileUpdateState {}
class ProFileUpdateSuccess extends ProfileUpdateState {}
class ProfileUpdateError extends ProfileUpdateState {}
class ProfileRollBack extends ProfileUpdateState {
  EmployerModel employerModel;
  ProfileRollBack(this.employerModel);
}