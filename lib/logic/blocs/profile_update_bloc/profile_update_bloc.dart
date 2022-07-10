import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../service/api/api_service.dart';
import '../../components/models/employer_model.dart';
import '../user_bloc/user_bloc.dart';

part 'profile_update_event.dart';
part 'profile_update_state.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  ProfileUpdateBloc() : super(ProfileUpdateInitial()) {
    on<ProfileSaveUpdatesEvent>(_onUpdate);
    on<ProfileRollBackEvent>(_onRollBack);
  }

  Future<void> _onUpdate(ProfileSaveUpdatesEvent event,emit) async {
    emit(ProfileUpdateInitial());
    try{
      ApiService apiService = ApiService();
      apiService.saveData(event.employerUpdateModel);
      emit(ProFileUpdateSuccess());
    }on DioError{
      emit(ProfileUpdateError());
    }
  }
  Future<void> _onRollBack(ProfileRollBackEvent event, emit) async {
    ApiService apiService = ApiService();
    EmployerModel employerModel = await apiService.getData();
    emit(ProfileRollBack(employerModel));
  }
}
