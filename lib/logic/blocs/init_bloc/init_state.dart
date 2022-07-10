part of 'init_cubit.dart';

abstract class InitState {}

class InitInitial extends InitState {}

class IsAuthorized extends InitState {
  EmployerModel employerModel;
  IsAuthorized(this.employerModel);
}

class IsNotAuthorized extends InitState {}