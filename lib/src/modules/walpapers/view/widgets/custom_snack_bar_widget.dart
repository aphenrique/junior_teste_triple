import 'package:flutter/material.dart';

import 'package:fteam_test/src/core/colors/app_colors.dart';

class CustomSnackBarWidget extends SnackBar {
  final String message;
  final Color color;

  CustomSnackBarWidget({
    Key? key,
    required this.message,
    this.color = AppColors.customColor,
  }) : super(
          key: key,
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.customColor,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        );
}
