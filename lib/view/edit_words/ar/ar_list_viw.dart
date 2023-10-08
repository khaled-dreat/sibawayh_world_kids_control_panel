part of '../../../utils/import/app_import.dart';

class ArListViewBuilder extends StatelessWidget {
  const ArListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerEducationData pEducMaterial =
        Provider.of<ControllerEducationData>(
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
                  educLang: EducLangEnum.ar.title,
                  id: data.elementAt(index).id,
                  educType: EducTypeEnum.reading.title,
                  exampleType: EducExamTypeEnum.word.title,
                ));
          },
        );
      },
    );
  }
}
