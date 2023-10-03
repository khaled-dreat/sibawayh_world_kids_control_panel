part of '../import/app_import.dart';

class AppLang {
  ///  [currentLang] return en or ar
  static String currentLang(BuildContext context) =>
      context.locale.languageCode;

  /// [setLang] change lang
  static void setLang(BuildContext context, Locale locale) =>
      context.setLocale(locale);

  static const String keySHOWLANG = 'SHOWLANG';

  /// [setShowLang] save key show lang  is false stop show selected lang
  static Future<void> setShowLang() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(keySHOWLANG, false);
  }

  /// [showSelectLang] get data saved in locale device
  static Future<bool> get showSelectLang async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    //* [pref.getBool] default true mean no choose before
    return pref.getBool(keySHOWLANG) ?? true;
  }
}
