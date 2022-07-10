import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_app/service/api/api_service.dart';
import '../../components/models/employer_model.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserLogout>(_onLogout);
    on<UpdateUser>(_onUpdate);
    on<UpdateUserImage>(_onUpdateImage);
    on<RollBackUser>(_onRollBack);
  }

  Future<void> _onUpdate(UpdateUser event, emit) async {
    emit(UserInitiated(event.employerModel));
  }

  Future<void> _onUpdateImage(UpdateUserImage event, emit) async {
    emit(UserInitiated((state.employerModel as EmployerModel).updateImage(event.logoPath)));
  }

  Future<void> _onLogout(UserEvent event, emit) async {
    await const FlutterSecureStorage().delete(key: 'token');
    emit(UserInitial());
  }
  Future<void> _onRollBack(RollBackUser event, emit) async {
    ApiService apiService = ApiService();
    EmployerModel employerModel = await apiService.getData();
    emit(UserInitiated(employerModel));
  }
}

