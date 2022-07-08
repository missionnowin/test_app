import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_app/logic/components/models/employer_model.dart';
import 'package:test_app/logic/components/models/sign_in_model.dart';
import 'package:test_app/service/api/api_service.dart';


part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>(_onSignIn);
  }

  Future<void> _onSignIn(SignInEvent event,emit) async {
      emit(SignInInitial());
      ApiService apiService = ApiService();
      try{
        String token = await apiService.auth(event.signInFormModel);
        await const FlutterSecureStorage().write(key: 'token', value: token);

        emit(SignInSuccess());

      } on DioError {
          emit(SignInError());
      }

  }
}
