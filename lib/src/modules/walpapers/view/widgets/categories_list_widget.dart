import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/photos_bloc.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/stores/page_params_store.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/category_button_widget.dart';

class CategoriesListWidget extends StatelessWidget {
  CategoriesListWidget({
    Key? key,
  }) : super(key: key);

  final photosBloc = Modular.get<PhotosBloc>();
  final pageParams = Modular.get<PageParamsStore>();

  final categories = <String>['face', 'animal', 'nature', 'car'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories
          .map(
            (e) => CategoryButton(term: e),
          )
          .toList(),
    );
  }
}
