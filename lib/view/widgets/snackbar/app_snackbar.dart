part of '../../../utils/import/app_import.dart';

class AppSnackBar {
  // ✅
  static void snackBarSuccess(BuildContext context, {required String msg}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: msg,
        backgroundColor: AppTheme.isDark(context)
            ? AppColors.darkModeSnack
            : AppColors.lightModeSnack,
        textStyle: TextStyle(
          color: AppColors.bgBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      displayDuration: const Duration(seconds: 1),
    );
  }

  // * ❌
  static void snackBarError(BuildContext context, {required String msg}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: msg),
      displayDuration: const Duration(seconds: 1),
    );
  }
}
