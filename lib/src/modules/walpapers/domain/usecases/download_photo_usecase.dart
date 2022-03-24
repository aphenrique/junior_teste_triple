import 'dart:io';

import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/core/utils/validators/url_validator.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/repositories/photo_repository.dart';

abstract class DownloadPhotoUsecase {
  Future<Either<PhotoException, File>> call({required String imagePath});
}

class DownloadPhotoUsecaseImpl implements DownloadPhotoUsecase {
  final PhotoRepository _repository;

  DownloadPhotoUsecaseImpl(this._repository);

  @override
  Future<Either<PhotoException, File>> call({required String imagePath}) async {
    if (imagePath.trim().isEmpty || UrlValidator.isValid(imagePath)) {
      return left(PhotoParamsException('Caminho inválido'));
    }

    return await _repository.downloadPhoto(imagePath: imagePath);
  }
}
