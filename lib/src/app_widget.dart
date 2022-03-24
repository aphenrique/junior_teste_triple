import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/core/colors/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F-Team Test',
      theme: ThemeData(
        primarySwatch: AppColors.customColor,
        snackBarTheme: SnackBarThemeData(
            backgroundColor: AppColors.customColor,
            contentTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            behavior: SnackBarBehavior.floating,
            elevation: 8),
      ),
    ).modular();
  }
}
