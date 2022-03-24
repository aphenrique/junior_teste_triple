import 'dart:developer';
import 'dart:io';

import 'package:fteam_test/src/core/utils/clients/errors/client_exception.dart';
import 'package:fteam_test/src/modules/walpapers/data/datasouces/download_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/external/download_service.dart';

class ImageDownloaderDatasource implements DownloadDatasource {
  final DownloadService service;

  ImageDownloaderDatasource(this.service);

  @override
  Future<File> downloadPhoto(String url) async {
    try {
      final result = await service.download(url);

      File file = File(result['path']);

      return file;
    } on ClientResponseException catch (e) {
      log(e.message, name: 'Client error', stackTrace: e.stackTrace);
      throw PhotoDatasourceException(e.message);
    } catch (e) {
      throw Exception();
    }
  }
}
