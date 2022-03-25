import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:fteam_test/src/modules/walpapers/domain/entities/photo_entity.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/states/fetch_photos_state.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/fetch_photos_store.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/page_params_store.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/custom_small_photo_widget.dart';

class CustomPhotoGridViewWidget extends StatefulWidget {
  const CustomPhotoGridViewWidget({Key? key}) : super(key: key);

  @override
  State<CustomPhotoGridViewWidget> createState() =>
      _CustomPhotoGridViewWidgetState();
}

class _CustomPhotoGridViewWidgetState extends State<CustomPhotoGridViewWidget> {
  List<PhotoEntity> photos = [];

  final photosStore = Modular.get<FetchPhotosStore>();
  final pageParams = Modular.get<PageParamsStore>();

  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(
      () {
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent - 80 &&
            photosStore.state is FetchPhotosSucessState) {
          pageParams.incrementApiPage();

          photosStore.fetchPhotos(pageParams);
        }
      },
    );

    photosStore.fetchPhotos(pageParams);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      store: photosStore,
      onError: (_, PhotoException? error) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${error?.message}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              photosStore.fetchPhotos(pageParams);
            },
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
      onLoading: (_) => const Center(child: CircularProgressIndicator()),
      onState: (_, state) {
        if (state is FetchPhotosInitialState) {
          photos.clear();
          pageParams.resetApiPage();
          return Container();
        }

        if (state is FetchPhotosSucessState) photos.addAll(state.photos);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: MediaQuery.of(context).size.aspectRatio,
                    maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  controller: scrollController,
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    final photo = photos[index];

                    return CustomSmallPhotoWidget(photoPath: photo.photoPath);
                  },
                ),
              ),
              if (state is FetchPhotosLoadingState)
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        );
      },
    );
  }
}
