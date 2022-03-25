import 'package:flutter/material.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/category_button_widget.dart';

class CategoriesListWidget extends StatelessWidget {
  CategoriesListWidget({
    Key? key,
  }) : super(key: key);

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
