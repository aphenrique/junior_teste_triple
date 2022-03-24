import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/core/utils/clients/uno_service.dart';
import 'package:fteam_test/src/modules/photos_module.dart';
import 'package:fteam_test/src/modules/walpapers/view/pages/photo_detail_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [Bind.lazySingleton((i) => UnoService())];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: PhotosModule()),
        ChildRoute('/photoDetail',
            child: (context, args) => PhotoDetailPage(imagePath: args.data)),
      ];
}
