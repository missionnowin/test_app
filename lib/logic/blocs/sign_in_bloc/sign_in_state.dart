part of 'sign_in_bloc.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInSuccess extends SignInState {
  EmployerModel employerModel;
  SignInSuccess(this.employerModel);
}
class SignInError extends SignInState {}
