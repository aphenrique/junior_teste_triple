import 'dart:developer';
import 'dart:io';

import 'package:fteam_test/environment_config.dart';
import 'package:fteam_test/src/core/utils/clients/errors/client_exception.dart';
import 'package:fteam_test/src/core/utils/connection_verifier/connection_verifier.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/external/http_service.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:uno/uno.dart';

class UnoService implements HttpService {
  final Uno uno = Uno(
    baseURL: 'https://api.pexels.com/v1/',
    headers: {'Authorization': EnvironmentConfig.apiToken},
    timeout: const Duration(seconds: 20),
  );

  @override
  Future<Map<String, dynamic>> get(String url) async {
    if (await ConnectionVerifier.isOnline()) {
      try {
        final result = await uno.get(url);

        return result.data;
      } on UnoError catch (e) {
        log(e.message, name: 'Uno error', stackTrace: e.stackTrace);
        throw ClientResponseException(e.message);
      } catch (e, s) {
        log(e.toString(), name: 'Uno error', stackTrace: s);
        throw ClientResponseException(e.toString());
      }
    } else {
      throw LostInternetConnection('Falha na conexão');
    }
  }

  @override
  Future<File> download(String url) async {
    if (await ConnectionVerifier.isOnline()) {
      try {
        String? imageId = await ImageDownloader.downloadImage(url,
            destination: AndroidDestinationType.directoryPictures);

        if (imageId != null) {
          String? path = await ImageDownloader.findPath(imageId);
          return File(path!);
        } else {
          throw ClientResponseException('Falha ao fazer o ');
        }
      } catch (e, s) {
        log(e.toString(), name: 'Uno error', stackTrace: s);
        throw ClientResponseException(e.toString());
      }
    } else {
      throw LostInternetConnection('Falha na conexão');
    }
  }
}
