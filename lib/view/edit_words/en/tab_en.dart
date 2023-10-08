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
      ControllerEducationData pEducMaterial =
          Provider.of<ControllerEducationData>(context, listen: false);
      pEducMaterial.changeEducaLang(EducLangEnum.en.title);
      pEducMaterial.getEducationalMaterials();
    });
  }

  @override
  Widget build(BuildContext context) {
    ControllerEducationData pEducMaterial =
        Provider.of<ControllerEducationData>(
      context,
    );
    return pEducMaterial.isGetAllEducMatr
        ? const AppLoading(
            loading: TypeLoading.page,
          )
        : (pEducMaterial.allWords.isNotEmpty)
            ? RefreshIndicator(
                onRefresh: onRefresh, child: const EnListViewBuilder())
            : ErrorText(title: AppLangKey.errorNoData);
  }

  Future<void> onRefresh() async {
    ControllerEducationData pEducMaterial =
        Provider.of<ControllerEducationData>(context, listen: false);
    pEducMaterial.fetchDataEduc();
  }
}
