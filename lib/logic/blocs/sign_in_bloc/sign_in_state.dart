part of 'sign_in_bloc.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInSuccess extends SignInState {}
class SignInError extends SignInState {}
