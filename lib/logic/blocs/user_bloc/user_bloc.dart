// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../components/models/employer_model.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserLogout>(_onLogout);
    on<UpdateUser>(_onUpdate);

  }

  Future<void> _onUpdate(UpdateUser event, emit) async {
    emit(UserInitiated(event.employerModel));
  }

  Future<void> _onLogout(UserEvent event, emit) async {
    await const FlutterSecureStorage().delete(key: 'token');
    emit(UserInitial());
  }
}

