part of '../../../../utils/import/app_import.dart';

class ListViwBuildEditWords extends StatelessWidget {
  const ListViwBuildEditWords({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerEducationalMaterialsManager pEducMaterial =
        Provider.of<ControllerEducationalMaterialsManager>(
      context,
    );
    final List<ModelEducation> data = pEducMaterial.allWords;

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 20.r),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return EducMaterialCard(
          data: data.elementAt(index),
          onTap: () {
            AppRoutes.goMaterial(
                context,
                EditingWord(
                  isEditing: true,
                  id: data.elementAt(index).id,
                  educType: EducTypeEnum.reading.title,
                  exampleType: EducExamTypeEnum.word.title,
                  lang: EducLangEnum.ar.title,
                ));
          },
        );
      },
    );
  }
}
