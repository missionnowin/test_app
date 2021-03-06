import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_app/logic/models/employer_model.dart';
import 'package:test_app/logic/models/sign_in_model.dart';
import 'package:test_app/service/api/api_service.dart';
import '../../models/sign_up_model.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>(_onSignUp);
  }

  Future<void> _onSignUp(SignUpEvent event,emit) async {
    emit(SignUpInitial());
    ApiService apiService = ApiService();
    try{
      if(await apiService.signUp(event.signUpFormModel) == 'ok'){
        String token = await apiService.auth(SignInModel(email: event.signUpFormModel.email, password: event.signUpFormModel.password));
        await const FlutterSecureStorage().write(key: 'token', value: token);
        EmployerModel employerModel = await apiService.getData();
        emit(SignUpSuccess(employerModel));
      }
    } on DioError catch (error){
      String response = error.response?.data['msg'];
      if (response == 'incorrect_email') {
        emit(SignUpEmailError());
      }
      else if (response == 'incorrect_phone'){
        emit(SignUpPhoneError());
      }
      else {
        emit(SignUpError());
      }
    }
  }
}
