part of '../import/app_import.dart';

class AppTheme {
  // * headline1
  static TextStyle? h1(BuildContext context) =>
      Theme.of(context).textTheme.displayLarge;
  // * headline2
  static TextStyle? h2(BuildContext context) =>
      Theme.of(context).textTheme.displayMedium;
  // * headline3
  static TextStyle? h3(BuildContext context) =>
      Theme.of(context).textTheme.displaySmall;
  // * headline4
  static TextStyle? h4(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium;
  // * headline5
  static TextStyle? h5(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall;
  // * headline6
  static TextStyle? h6(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge;
  // * bodyText1
  static TextStyle? b1(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge;
  // * bodyText2
  static TextStyle? b2(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;
  // * subtitle1
  static TextStyle? s1(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;
  // * subtitle2
  static TextStyle? s2(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall;
  // * caption
  static TextStyle? caption(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;
  // * button
  static TextStyle? btn(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge;

  // * check Theme dark or light (Application)
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  // * check Theme dark or light for Device not application theme
  static bool brightnessDevice() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.dark;
  }

  //  * return text light or dark
  static String textTheme(BuildContext context) =>
      isDark(context) ? AppLangKey.dark : AppLangKey.light;

  // * return color depend on theme
  static Color themeColor(BuildContext context) =>
      isDark(context) ? AppColors.darkMode : AppColors.lightMode;
  // todo : get appIconDark
  // * return icon depend on theme
  static String iconApp(BuildContext context) =>
      isDark(context) ? AppImages.appLogo : AppImages.appLogo;

  static Color colorAuth(BuildContext context) =>
      isDark(context) ? AppColors.bgPink : AppColors.bgBlue;

  static Color iconColorTheme(BuildContext context) =>
      isDark(context) ? AppColors.bgWhite : AppColors.bgBlue;

  static Color borderErrorTheme(BuildContext context) =>
      isDark(context) ? Colors.pink : AppColors.bgRed;
}
