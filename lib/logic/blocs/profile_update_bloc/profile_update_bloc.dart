import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../components/models/employer_update_form_model.dart';

part 'profile_update_event.dart';
part 'profile_update_state.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  ProfileUpdateBloc() : super(ProfileUpdateInitial()) {
    on<ProfileUpdateEvent>(_onUpdate);
  }

  Future<void> _onUpdate(ProfileUpdateEvent event,emit) async {
    emit(ProfileUpdateInitial());

  }
}
