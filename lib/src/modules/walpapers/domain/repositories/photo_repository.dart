import 'dart:io';

import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';

abstract class PhotoRepository {
  Future<Either<PhotoException, List<PhotoEntity>>> fetchPhotos(
      {String? query, required int apiPage, required int perPage});

  Future<Either<PhotoException, File>> downloadPhoto(
      {required String imagePath});
}
