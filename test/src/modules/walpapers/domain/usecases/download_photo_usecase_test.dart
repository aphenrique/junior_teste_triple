import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fteam_test/src/core/utils/either.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/domain/usecases/download_photo_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../repositories/photo_repository_mock.dart';

void main() {
  final repository = PhotoRepositoryMock();
  final usecase = DownloadPhotoUsecaseImpl(repository);

  test('Should return right to photo download download', () async {
    const String imagePath =
        'https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg';

    // when
    when(() => repository.downloadPhoto(imagePath: imagePath))
        .thenAnswer((_) async => right(
              File(''),
            ));

    // do
    final result = await usecase(imagePath: imagePath);

    // expect
    expect(result.isRight, true);
    verify(() => repository.downloadPhoto(imagePath: imagePath)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Should return PhotoParamsException caused by empty param', () async {
    const String imagePath = ' ';

    // when

    // do
    final result = await usecase(imagePath: imagePath);
    final expectedValue = result.fold((l) => l, (r) => r);

    // expect
    expect(expectedValue, isA<PhotoParamsException>());
    verifyNever(() => repository.downloadPhoto(imagePath: imagePath));
    verifyNoMoreInteractions(repository);
  });

  test('Should return PhotoParamsException caused by invalid url', () async {
    const String imagePath = 'invalid.com/photo.jpg'; //link sem https://

    // when

    // do
    final result = await usecase(imagePath: imagePath);
    final expectedValue = result.fold((l) => l, (r) => r);

    // expect
    expect(expectedValue, isA<PhotoParamsException>());
    verifyNever(() => repository.downloadPhoto(imagePath: imagePath));
    verifyNoMoreInteractions(repository);
  });
}
