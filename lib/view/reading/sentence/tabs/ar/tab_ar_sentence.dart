part of '../../../../../utils/import/app_import.dart';

class TabArSentence extends StatefulWidget {
  const TabArSentence({super.key});

  @override
  State<TabArSentence> createState() => _TabArSentenceState();
}

class _TabArSentenceState extends State<TabArSentence> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ControllerEducationManeg pEducMaterial =
          Provider.of<ControllerEducationManeg>(context, listen: false);
      pEducMaterial.changeEducaLang(EducLangEnum.ar.title);
      pEducMaterial.getAllEducation(
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
            ? const ArListViewBuilderSentence()
            : ErrorText(title: AppLangKey.errorNoData);
  }
}
