import 'dart:io';

import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';

abstract class PhotoDatasource {
  Future<List<PhotoEntity>> fetchPhotos(
      {required int apiPage, required int perPage});
  Future<List<PhotoEntity>> searchPhotos(
      {required String query, required int apiPage, required int perPage});
}
