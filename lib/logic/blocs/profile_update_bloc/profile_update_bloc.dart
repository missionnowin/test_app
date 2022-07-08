import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../service/api/api_service.dart';
import '../../components/models/employer_model.dart';

part 'profile_update_event.dart';
part 'profile_update_state.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  ProfileUpdateBloc() : super(ProfileUpdateInitial()) {
    on<ProfileUpdateEvent>(_onUpdate);
  }

  Future<void> _onUpdate(ProfileUpdateEvent event,emit) async {
    emit(ProfileUpdateInitial());
    try{
      ApiService apiService = ApiService();
      apiService.saveData(event.employerUpdateModel);
      emit(ProFileUpdateSuccess());
    }on DioError{
      emit(ProfileUpdateError());
    }
  }
}
