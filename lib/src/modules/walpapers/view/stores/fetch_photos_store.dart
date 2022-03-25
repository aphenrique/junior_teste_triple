import 'package:flutter_triple/flutter_triple.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/usecases/fetch_photos_usecase.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/states/fetch_photos_state.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/page_params_store.dart';

class FetchPhotosStore extends NotifierStore<PhotoException, FetchPhotosState> {
  final FetchPhotosUsecase _fetchPhotosUsecase;

  FetchPhotosStore(this._fetchPhotosUsecase) : super(FetchPhotosInitialState());

  Future<void> fetchPhotos(PageParamsStore params) async {
    setLoading(true);

    if (params.apiPage == 1) {
      update(FetchPhotosInitialState());
      await Future.delayed(const Duration(milliseconds: 200));
    }

    final response = await _fetchPhotosUsecase(
      query: params.query,
      apiPage: params.apiPage,
      perPage: params.perPage,
    );

    update(FetchPhotosLoadingState());
    await Future.delayed(const Duration(milliseconds: 500));
    update(
      response.fold(
        (failure) => FetchPhotosErrorState(failure.message),
        (photos) => FetchPhotosSucessState(photos),
      ),
    );
  }
}
