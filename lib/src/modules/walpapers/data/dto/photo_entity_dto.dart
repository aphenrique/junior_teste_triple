import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';

class PhotoEntityDto extends PhotoEntity {
  PhotoEntityDto({
    required String originalPath,
  }) : super(
          photoPath: originalPath,
        );

  Map<String, dynamic> toMap() {
    return {
      'originalPath': photoPath,
    };
  }

  factory PhotoEntityDto.fromMap(Map<String, dynamic> map) {
    return PhotoEntityDto(
      originalPath: map['src']['tiny'] ?? '',
    );
  }
}
