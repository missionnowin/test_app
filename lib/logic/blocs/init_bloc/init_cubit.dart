import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
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
        ApiService().getData();
        emit(IsAuthorized());
      }catch (e){
        emit(IsNotAuthorized());
      }
    }
  }
}
