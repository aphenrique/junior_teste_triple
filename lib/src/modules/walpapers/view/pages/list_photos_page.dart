import 'package:flutter/material.dart';
import 'package:fteam_test/src/core/colors/app_colors.dart';
import 'package:fteam_test/src/modules/walpapers/view/components/per_page_slide_component.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/categories_list_widget.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/custom_photo_grid_view_widget.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/custom_search_bar_widget.dart';

class ListPhotosPage extends StatefulWidget {
  const ListPhotosPage({Key? key}) : super(key: key);

  @override
  State<ListPhotosPage> createState() => _ListPhotosPageState();
}

class _ListPhotosPageState extends State<ListPhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Wallpaper',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: 2.0,
          ),
        ),
        actions: const [
          PerPageSlideComponent(),
        ],
        bottom: CustomSerchBarWidget(),
      ),
      body: Column(
        children: [
          CategoriesListWidget(),
          const Expanded(
            child: CustomPhotoGridViewWidget(),
          ),
        ],
      ),
    );
  }
}
