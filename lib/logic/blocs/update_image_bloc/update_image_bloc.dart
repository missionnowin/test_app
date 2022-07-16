// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/service/api/api_service.dart';
part 'update_image_event.dart';
part 'update_image_state.dart';

class UpdateImageBloc extends Bloc<UpdateImageEvent, UpdateImageState> {
  UpdateImageBloc() : super(UpdateImageInitial()) {
    on<UpdateImageEvent>(_onUpdate);
  }

  Future<void> _onUpdate(UpdateImageEvent event,emit) async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(UpdateImageInitial());
        final fileSizeMB = await image.length() / (1024 * 1024);
        if(fileSizeMB < 40){
          event.logoPath = await ApiService().uploadFile(image.path);
          emit(UpdateImageSuccess(event.logoPath));
        }
      }
    }catch (e){
      emit(UpdateImageError());
    }
  }
}
