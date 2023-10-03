part of '../../../utils/import/app_import.dart';

class FlagLang extends StatelessWidget {
  const FlagLang({Key? key, required this.lang}) : super(key: key);
  final String lang;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(AppDime.md.r),
        child: InkWell(
          onTap: () {
            // * Change Lang
            AppLang.setLang(context,
                lang == kEn ? AppLangConfig.enLocale : AppLangConfig.arLocale);
            // * change shared preference key to false (false stop show lang)
            AppLang.setShowLang();
            // * Push  Wrapper
            AppRoutes.go(context, Wrapper.nameRoute);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage(
                    lang == kEn ? AppImages.unitedStates : AppImages.saudi),
              ),
              Text(
                lang == kEn ? AppLangKey.english : AppLangKey.arabic,
                style:
                    AppTheme.h6(context)?.copyWith(fontWeight: FontWeight.bold),
              ).tr()
            ],
          ),
        ),
      ),
    );
  }
}
