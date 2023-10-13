part of '../../../../../utils/import/app_import.dart';

class TabEnLetters extends StatefulWidget {
  const TabEnLetters({super.key});

  @override
  State<TabEnLetters> createState() => _TabEnLettersState();
}

class _TabEnLettersState extends State<TabEnLetters> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ControllerEducationManeg pEducMaterial =
          Provider.of<ControllerEducationManeg>(context, listen: false);
      pEducMaterial.changeEducaLang(EducLangEnum.en.title);
      pEducMaterial.fetchEducationData(
          exampleType: EducExamTypeEnum.letter.title);
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
            ? const EnListViewBuilderLetters()
            : ErrorText(title: AppLangKey.errorNoData);
  }
}
