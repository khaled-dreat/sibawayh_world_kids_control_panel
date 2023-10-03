part of '../../../utils/import/app_import.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({
    super.key,
    this.height,
    required this.title,
    required this.onTap,
  });

  final double? height;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppTheme.isDark(context)
          ? AppColors.splashBtnDark
          : AppColors.splashBtnLight,
      borderRadius: BorderRadius.circular(AppDime.xxl.r),
      child: Container(
        width: AppDime.fullScreen.sw,
        height: height ?? AppDime.heightBtn.h,
        margin: EdgeInsets.symmetric(
          horizontal: AppDime.md.r,
          vertical: AppDime.md.r,
        ),
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(AppDime.xxl.r),
          gradient: LinearGradient(
            colors: AppTheme.isDark(context)
                ? AppColors.btnColorsDark
                : AppColors.btnColorsLight,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          title.tr().toUpperCase(),
          style: AppTheme.h5(context)?.copyWith(color: AppColors.bgWhite),
        ),
      ),
    );
  }
}
