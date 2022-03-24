import 'dart:developer';
import 'dart:io';

import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/data/datasouces/download_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/data/datasouces/photo_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDatasource _photoDatasource;
  final DownloadDatasource _downloadDatasource;

  PhotoRepositoryImpl(this._photoDatasource, this._downloadDatasource);

  @override
  Future<Either<PhotoException, List<PhotoEntity>>> fetchPhotos(
      {String? query, required int apiPage, required int perPage}) async {
    try {
      List<PhotoEntity> result;

      if (query != null) {
        result = await _photoDatasource.searchPhotos(
            query: query, apiPage: apiPage, perPage: perPage);
      } else {
        result = await _photoDatasource.fetchPhotos(
            apiPage: apiPage, perPage: perPage);
      }
      return right(result);
    } on PhotoDatasourceException catch (e) {
      return left(PhotoDatasourceException(e.toString()));
    }
  }

  @override
  Future<Either<PhotoException, File>> downloadPhoto(
      {required String imagePath}) async {
    try {
      final result = await _downloadDatasource.downloadPhoto(imagePath);

      return right(result);
    } catch (e) {
      log('Falha ao buscar o arquivo', name: 'Datasource error');
      return left(PhotoDatasourceException(e.toString()));
    }
  }
}
