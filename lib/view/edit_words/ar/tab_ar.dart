part of '../../../utils/import/app_import.dart';

class TabAr extends StatefulWidget {
  const TabAr({super.key});

  @override
  State<TabAr> createState() => _TabArState();
}

class _TabArState extends State<TabAr> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ControllerEducationData pEducMaterial =
          Provider.of<ControllerEducationData>(context, listen: false);
      pEducMaterial.changeEducaLang(EducLangEnum.ar.title);
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
            ? const ArListViewBuilder()
            : ErrorText(title: AppLangKey.errorNoData);
  }

  Future<void> onRefresh() async {
    ControllerEducationData pEducMaterial =
        Provider.of<ControllerEducationData>(context, listen: false);
    pEducMaterial.fetchDataEduc();
  }
}
