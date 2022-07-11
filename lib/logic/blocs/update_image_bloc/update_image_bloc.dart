import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/service/api/api_service.dart';
import '../../components/models/employer_model.dart';

part 'update_image_event.dart';
part 'update_image_state.dart';

class UpdateImageBloc extends Bloc<UpdateImageEvent, UpdateImageState> {
  UpdateImageBloc() : super(UpdateImageInitial()) {
    on<UpdateImageEvent>(_onUpdate);
  }

  Future<void> _onUpdate(UpdateImageEvent event,emit) async {
    emit(UpdateImageInitial());
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        final fileSizeMB = await image.length() / (1024 * 1024);
        if(fileSizeMB < 40){
          event.employerUpdateModel.logoPath = await ApiService().uploadFile(image.path);
          emit(UpdateImageSuccess(event.employerUpdateModel));
        }
      }
    }catch (e){
      emit(UpdateImageError());
    }
  }
}
