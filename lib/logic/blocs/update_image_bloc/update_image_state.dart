part of 'update_image_bloc.dart';

abstract class UpdateImageState {}

class UpdateImageInitial extends UpdateImageState {}
class UpdateImageError extends UpdateImageState {}
class UpdateImageSuccess extends UpdateImageState {
  final String logoPath;
  UpdateImageSuccess(this.logoPath);
}
