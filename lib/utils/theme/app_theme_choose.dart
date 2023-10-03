part of '../import/app_import.dart';

class AppThemeChoose {
  // * Font Family Lang
  static String? enFont = GoogleFonts.aBeeZee().fontFamily;
  static String? arFont = GoogleFonts.cairo().fontFamily;

  // * Check Lang
  static String? fontFamily(BuildContext context) =>
      AppLang.currentLang(context) == kEn ? enFont : arFont;

  // * Light
  static ThemeData light(BuildContext context) {
    return ThemeData.light().copyWith(
      // * appBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgWhite,
        foregroundColor: AppColors.bgBlack,
        elevation: 10,
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ),
      //  *  card theme
      cardTheme: CardTheme(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDime.lg.r),
        ),
      ),
      // * text Theme
      /// displayColor ~>  headline1 to headline4, and caption
      /// bodyColor  ~> is applied to the remaining text styles.
      textTheme: Theme.of(context).textTheme.apply(
          displayColor: AppColors.bgBlack,
          bodyColor: AppColors.bgBlack,
          fontFamily: fontFamily(context)),
      // * tab bar theme
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.bgBlack,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.lightTab, width: 3),
        ),
      ),
    );
  }

  // * Dark
  static ThemeData dark(BuildContext context) {
    // * appBar Theme
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        elevation: 10,
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: AppColors.bgWhite),
      ),
      //  *  card theme
      cardTheme: CardTheme(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDime.lg.r),
        ),
      ),

      // * text Theme
      /// displayColor ~>  headline1 to headline4, and caption
      /// bodyColor  ~> is applied to the remaining text styles.
      textTheme: Theme.of(context).textTheme.apply(
            displayColor: AppColors.bgWhite,
            bodyColor: AppColors.bgWhite,
            fontFamily: fontFamily(context),
          ),

      // * tab bar theme
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.bgWhite,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.darkTab, width: 3),
        ),
      ),
    );
  }
}
