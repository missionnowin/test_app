part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpSuccess extends SignUpState {
  EmployerModel employerModel;
  SignUpSuccess(this.employerModel);
}
class SignUpError extends SignUpState {}
