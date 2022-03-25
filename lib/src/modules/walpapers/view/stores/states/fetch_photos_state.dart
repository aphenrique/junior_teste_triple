import '../../../domain/entities/photo_entity.dart';

abstract class FetchPhotosState {}

class FetchPhotosInitialState extends FetchPhotosState {}

class FetchPhotosSucessState extends FetchPhotosState {
  final List<PhotoEntity> photos;

  FetchPhotosSucessState(this.photos);
}

class FetchPhotosErrorState extends FetchPhotosState {
  final String message;

  FetchPhotosErrorState(this.message);
}

class FetchPhotosLoadingState extends FetchPhotosState {}
