part of 'profile_update_bloc.dart';
abstract class ProfileUpdateEvent{}

class ProfileSaveUpdatesEvent extends ProfileUpdateEvent{
    final EmployerModel employerUpdateModel;
    ProfileSaveUpdatesEvent(this.employerUpdateModel);
}

class ProfileRollBackEvent extends ProfileUpdateEvent{

}

