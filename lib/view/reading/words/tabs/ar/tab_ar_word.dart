part of '../../../../../utils/import/app_import.dart';

class TabArWord extends StatefulWidget {
  const TabArWord({super.key});

  @override
  State<TabArWord> createState() => _TabArWordState();
}

class _TabArWordState extends State<TabArWord> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ControllerEducationManeg pEducMaterial =
          Provider.of<ControllerEducationManeg>(context, listen: false);
      pEducMaterial.changeEducaLang(EducLangEnum.ar.title);
      pEducMaterial.getAllEducation(exampleType: EducExamTypeEnum.letter.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    ControllerEducationManeg pEducMaterial =
        Provider.of<ControllerEducationManeg>(
      context,
    );
    return pEducMaterial.isGetAllEducMatr
        ? const AppLoading(
            loading: TypeLoading.page,
          )
        : (pEducMaterial.allEducation.isNotEmpty)
            ? const ArListViewBuilderWords()
            : ErrorText(title: AppLangKey.errorNoData);
  }
}
