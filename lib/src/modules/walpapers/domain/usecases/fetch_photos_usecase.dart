import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/repositories/photo_repository.dart';

abstract class FetchPhotosUsecase {
  Future<Either<PhotoException, List<PhotoEntity>>> call(
      {String? query, required int apiPage, required int perPage});
}

class FetchPhotosUsecaseImpl implements FetchPhotosUsecase {
  final PhotoRepository _repository;

  FetchPhotosUsecaseImpl(this._repository);

  @override
  Future<Either<PhotoException, List<PhotoEntity>>> call(
      {String? query, required int apiPage, required int perPage}) async {
    if (apiPage < 1 || perPage < 1) {
      return left(PhotoParamsException('Parâmetros fora da faixa'));
    }

    if (query != null && query.trim().isEmpty) {
      return left(PhotoParamsException('Favor preencher a pesquisa'));
    }

    return await _repository.fetchPhotos(
        query: query, apiPage: apiPage, perPage: perPage);
  }
}
