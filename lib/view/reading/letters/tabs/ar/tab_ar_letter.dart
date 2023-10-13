part of '../../../../../utils/import/app_import.dart';

class TabArLetter extends StatefulWidget {
  const TabArLetter({super.key});

  @override
  State<TabArLetter> createState() => _TabArLetterState();
}

class _TabArLetterState extends State<TabArLetter> {
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
            ? const ArListViewBuilderLeters()
            : ErrorText(title: AppLangKey.errorNoData);
  }
}
