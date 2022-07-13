part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpSuccess extends SignUpState {
  EmployerModel employerModel;
  SignUpSuccess(this.employerModel);
}
class SignUpEmailError extends SignUpState {}
class SignUpPhoneError extends SignUpState {}
class SignUpError extends SignUpState {}
