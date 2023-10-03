part of '../../utils/import/app_import.dart';

class PageSelectedLang extends StatelessWidget {
  static const nameRoute = 'PageSelectedLang';

  const PageSelectedLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLangKey.selectLanguage,
            style: AppTheme.h5(context)?.copyWith(fontWeight: FontWeight.bold),
          ).tr(),
          Row(
            children: [
              // * English
              FlagLang(lang: kEn),
              // * Arabic
              FlagLang(lang: kAr),
            ],
          ),
        ],
      ),
    );
  }
}
