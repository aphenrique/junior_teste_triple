import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/core/colors/app_colors.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/fetch_photos_store.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/page_params_store.dart';

class CustomSerchBarWidget extends StatelessWidget implements PreferredSize {
  CustomSerchBarWidget({Key? key}) : super(key: key);

  final photosStore = Modular.get<FetchPhotosStore>();
  final pageParams = Modular.get<PageParamsStore>();

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: 80,
      child: TextField(
        cursorColor: AppColors.searchFieldColor,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          pageParams.resetApiPage();

          pageParams.setQuery(value.trim().isNotEmpty ? value : null);

          photosStore.fetchPhotos(pageParams);
        },
        style: const TextStyle(
          color: AppColors.searchFieldColor,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.searchFieldColor,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: AppColors.searchFieldColor),
          fillColor: AppColors.backgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
