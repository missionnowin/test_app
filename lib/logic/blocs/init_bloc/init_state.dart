part of 'init_cubit.dart';

@immutable
abstract class InitState {}

class InitInitial extends InitState {}

class IsAuthorized extends InitState {}

class IsNotAuthorized extends InitState {}