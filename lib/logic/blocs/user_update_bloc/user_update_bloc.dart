import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:test_app/logic/components/models/employer_model.dart';
part 'user_update_event.dart';
part 'user_update_state.dart';

class UserUpdateBloc extends Bloc<UserUpdateEvent, UserUpdateState> {
  UserUpdateBloc(EmployerModel employerModel) : super(UserUpdateInitial(employerModel)) {
    on<UpdateUserEvent>(_onUpdate);
    on<CancelUpdateEvent>(_onCancel);
  }

  Future<void> _onUpdate(UpdateUserEvent event, Emitter<UserUpdateState> emit) async {
  }

  Future<void> _onCancel(CancelUpdateEvent event, Emitter<UserUpdateState> emit) async {
  }
}
