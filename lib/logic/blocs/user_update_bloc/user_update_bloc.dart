import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:test_app/logic/models/employer_model.dart';
part 'user_update_event.dart';
part 'user_update_state.dart';

class UserUpdateBloc extends Bloc<UpdateEvent, UserUpdateState> {
  UserUpdateBloc(EmployerModel employerModel) : super(UserUpdateInitial(employerModel)) {
    on<UpdateUserEvent>(_onUpdate);
    on<CancelUpdateEvent>(_onCancel);
    on<UserUpdateImageEvent>(_onImageUpdate);
  }

  Future<void> _onUpdate(UpdateUserEvent event, emit) async {
    emit(UserUpToDateState(event.employerModel));
  }

  Future<void> _onCancel(CancelUpdateEvent event, emit) async {
    emit(UserCancelState());
  }

  Future<void> _onImageUpdate(UserUpdateImageEvent event, emit) async {
    state.employerModel!.updateImage(event.logoPath);
    emit(UserUpdateInitial(state.employerModel));
  }
}
