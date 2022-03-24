import 'dart:developer';
import 'dart:io';

import 'package:fteam_test/src/core/utils/clients/errors/client_exception.dart';
import 'package:fteam_test/src/core/utils/connection_verifier/connection_verifier.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/external/download_service.dart';
import 'package:image_downloader/image_downloader.dart';

class ImageDownloaderService implements DownloadService {
  @override
  Future<Map<String, dynamic>> download(String url) async {
    if (await ConnectionVerifier.isOnline()) {
      try {
        String? imageId = await ImageDownloader.downloadImage(url,
            destination: AndroidDestinationType.directoryPictures);

        if (imageId == null) {
          throw ClientResponseException('Falha ao buscar a imagem');
        }

        var fileName = await ImageDownloader.findName(imageId);
        var path = await ImageDownloader.findPath(imageId);
        var size = await ImageDownloader.findByteSize(imageId);
        var mimeType = await ImageDownloader.findMimeType(imageId);

        Map<String, dynamic> map = {
          'fileName': fileName,
          'path': path,
          'size': size,
          'mimeType': mimeType,
        };

        return map;
      } catch (e, s) {
        log(e.toString(), name: 'Image Downloader error', stackTrace: s);
        throw ClientResponseException(e.toString());
      }
    } else {
      throw LostInternetConnection('Falha na conexão');
    }
  }
}
