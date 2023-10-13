part of '../../../../../utils/import/app_import.dart';

class TabEnSentence extends StatefulWidget {
  const TabEnSentence({super.key});

  @override
  State<TabEnSentence> createState() => _TabEnSentenceState();
}

class _TabEnSentenceState extends State<TabEnSentence> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ControllerEducationManeg pEducMaterial =
          Provider.of<ControllerEducationManeg>(context, listen: false);
      pEducMaterial.changeEducaLang(EducLangEnum.en.title);
      pEducMaterial.fetchEducationData(
          exampleType: EducExamTypeEnum.sentence.title);
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
            ? const EnListViewBuilderSentence()
            : ErrorText(title: AppLangKey.errorNoData);
  }
}
