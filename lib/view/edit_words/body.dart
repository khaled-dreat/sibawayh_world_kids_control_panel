part of '../../utils/import/app_import.dart';

class EditWords extends StatefulWidget {
  static const String nameRoute = "EditWords";
  const EditWords({super.key});

  @override
  State<EditWords> createState() => _EditWordsState();
}

class _EditWordsState extends State<EditWords> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ControllerEducationalMaterialsManager pEducMaterial =
          Provider.of<ControllerEducationalMaterialsManager>(context,
              listen: false);
      pEducMaterial.getAllEducationalMaterials();
    });
  }

  @override
  Widget build(BuildContext context) {
    ControllerEducationalMaterialsManager pEducMaterial =
        Provider.of<ControllerEducationalMaterialsManager>(
      context,
    );
    return Scaffold(
      appBar: const CustomAppBarSrh(),
      body: pEducMaterial.isGetAllEducMatr
          ? const AppLoading(
              loading: TypeLoading.page,
            )
          : (pEducMaterial.allWords.isNotEmpty)
              ? const ListViwBuildEditWords()
              : ErrorText(title: AppLangKey.errorNoData),
      floatingActionButton: CustomFloatingActionButton(
        educType: EducTypeEnum.reading.title,
        exampleType: EducExamTypeEnum.word.title,
        lang: EducLangEnum.ar.title,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
