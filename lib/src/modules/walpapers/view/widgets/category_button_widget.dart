import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/core/colors/app_colors.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/fetch_photos_store.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/page_params_store.dart';

class CategoryButton extends StatelessWidget {
  final String term;

  CategoryButton({
    Key? key,
    required this.term,
  }) : super(key: key);

  final photosStore = Modular.get<FetchPhotosStore>();
  final pageParams = Modular.get<PageParamsStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: () {
          pageParams.resetApiPage();
          pageParams.resetQuery();

          pageParams.setQuery(term);

          photosStore.fetchPhotos(pageParams);
        },
        child: Text(
          term.toUpperCase(),
          style: const TextStyle(color: AppColors.searchFieldColor),
        ),
      ),
    );
  }
}
