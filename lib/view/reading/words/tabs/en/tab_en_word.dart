part of '../../../../../utils/import/app_import.dart';

class TabEnWord extends StatefulWidget {
  const TabEnWord({super.key});

  @override
  State<TabEnWord> createState() => _TabEnWordState();
}

class _TabEnWordState extends State<TabEnWord> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ControllerEducationManeg pEducMaterial =
          Provider.of<ControllerEducationManeg>(context, listen: false);
      pEducMaterial.changeEducaLang(EducLangEnum.en.title);
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
            ? const EnListViewBuilderWord()
            : ErrorText(title: AppLangKey.errorNoData);
  }
}
