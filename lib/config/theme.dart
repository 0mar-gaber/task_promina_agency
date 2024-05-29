import 'package:flutter/material.dart';
import 'package:task_manager_app/core/utils/colors.dart';

class AppTheme{
  static ThemeData theme =ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.backGroundColor,
        background: AppColors.backGroundColor,
        primary: AppColors.primaryColor,
        scrim: AppColors.textColor,
      secondary: AppColors.secondaryColor
    ),
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.backGroundColor

  );
}
