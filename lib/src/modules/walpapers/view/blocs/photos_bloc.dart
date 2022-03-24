import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fteam_test/src/modules/walpapers/domain/usecases/fetch_photos_usecase.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/events/photos_event.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/states/photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final FetchPhotosUsecase fetchPhotosUsecase;

  PhotosBloc(this.fetchPhotosUsecase) : super(FetchPhotosInitial()) {
    on<FetchPhotosEvent>(fetchPhotos);
  }

  fetchPhotos(FetchPhotosEvent event, Emitter<PhotosState> emit) async {
    if (event.apiPage == 1) {
      emit(FetchPhotosInitial());
      await Future.delayed(const Duration(milliseconds: 200));
    }

    emit(FetchPhotosLoading());

    final response = await fetchPhotosUsecase(
      query: event.query,
      apiPage: event.apiPage,
      perPage: event.perPage,
    );

    emit(
      response.fold(
        (failure) => FetchPhotosError('Erro ao buscar fotos'),
        (photos) {
          return FetchPhotosSucess(photos);
        },
      ),
    );
  }
}
