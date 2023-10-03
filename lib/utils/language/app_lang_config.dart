part of '../import/app_import.dart';

String kEn = 'en';
String kAr = 'ar';

class AppLangConfig {
  // path Folder Lang
  static String path = 'assets/lang';

  // * Support Locale Lang
  static Locale enLocale = const Locale('en');
  static Locale arLocale = const Locale('ar');

  static List<Locale> supportLocale = [enLocale, arLocale];
}
