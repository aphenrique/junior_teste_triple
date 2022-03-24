import 'dart:io';

abstract class DownloadDatasource {
  Future<File> downloadPhoto(String url);
}
