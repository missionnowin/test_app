// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_app/logic/components/models/employer_model.dart';
import 'package:test_app/service/api/api_service.dart';

part 'init_state.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit() : super(InitInitial());

  Future<void> init() async{
    emit(InitInitial());
    final String token = await const FlutterSecureStorage().read(key: "token") ?? "";
    if(token.isEmpty){
      emit(IsNotAuthorized());
    }
    else{
      try{
        ApiService api = ApiService();
        EmployerModel employerModel = await api.getData();
        emit(IsAuthorized(employerModel));
      }catch (e){
        emit(IsNotAuthorized());
      }
    }
  }
}
