part of '../../../utils/import/app_import.dart';

class TabEn extends StatefulWidget {
  const TabEn({super.key});

  @override
  State<TabEn> createState() => _TabEnState();
}

class _TabEnState extends State<TabEn> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ControllerWordManeg pEducMaterial =
          Provider.of<ControllerWordManeg>(context, listen: false);
      pEducMaterial.changeEducaLang(EducLangEnum.en.title);
      pEducMaterial.getAllWord();
    });
  }

  @override
  Widget build(BuildContext context) {
    ControllerWordManeg pEducMaterial = Provider.of<ControllerWordManeg>(
      context,
    );
    return pEducMaterial.isGetAllEducMatr
        ? const AppLoading(
            loading: TypeLoading.page,
          )
        : (pEducMaterial.allWords.isNotEmpty)
            ? const EnListViewBuilder()
            : ErrorText(title: AppLangKey.errorNoData);
  }
}
