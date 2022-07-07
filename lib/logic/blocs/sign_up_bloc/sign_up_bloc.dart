import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_app/logic/components/models/sign_in_form_model.dart';
import 'package:test_app/service/api/api_service.dart';
import '../../components/models/sign_up_form_model.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>(_onSignIn);
  }

  Future<void> _onSignIn(SignUpEvent event,emit) async {
    emit(SignUpInitial());
    ApiService apiService = ApiService();
    try{
      apiService.signUp(event.signUpFormModel);
      String token = await apiService.auth(SignInFormModel(email: event.signUpFormModel.email, password: event.signUpFormModel.password));
      await const FlutterSecureStorage().write(key: 'token', value: token);
      emit(SignUpSuccess());
    } on DioError catch (e){
      emit(SignUpError());
    }
  }
}
