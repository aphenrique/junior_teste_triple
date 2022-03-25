import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/core/utils/clients/image_downloader_service.dart';
import 'package:fteam_test/src/core/utils/clients/uno_service.dart';
import 'package:fteam_test/src/modules/walpapers/data/repositories/photo_repository_impl.dart';
import 'package:fteam_test/src/modules/walpapers/domain/usecases/download_photo_usecase.dart';
import 'package:fteam_test/src/modules/walpapers/domain/usecases/fetch_photos_usecase.dart';
import 'package:fteam_test/src/modules/walpapers/external/api_photo_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/external/image_downloader_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/fetch_photos_store.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/page_params_store.dart';
import 'package:fteam_test/src/modules/walpapers/view/pages/list_photos_page.dart';

class PhotosModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => UnoService()),
        Bind.lazySingleton((i) => ImageDownloaderService()),
        Bind.singleton((i) => ApiPhotoDatasource(i())),
        Bind.singleton((i) => ImageDownloaderDatasource(i())),
        Bind.singleton((i) => PhotoRepositoryImpl(i(), i())),
        Bind.singleton((i) => FetchPhotosUsecaseImpl(i())),
        Bind.singleton((i) => DownloadPhotoUsecaseImpl(i())),
        Bind.lazySingleton((i) => FetchPhotosStore(i())),

        // stores
        Bind.singleton((i) => PageParamsStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const ListPhotosPage()),
      ];
}
