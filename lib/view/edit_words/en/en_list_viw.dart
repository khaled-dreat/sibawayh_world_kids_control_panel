part of '../../../utils/import/app_import.dart';

class EnListViewBuilder extends StatelessWidget {
  const EnListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerSrh pSrh = Provider.of<ControllerSrh>(
      context,
    );

    return StreamBuilder<QuerySnapshot>(
        stream: pSrh.srhQuery(EducLangEnum.en.title),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorText(title: AppLangKey.errorNoData);
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoading(
              loading: TypeLoading.page,
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              QueryDocumentSnapshot<Object?> data = snapshot.data!.docs[index];

              return EducMaterialCard(
                data: data,
                onTap: () {
                  AppRoutes.goMaterial(
                      context,
                      EditingWord(
                        educLang: EducLangEnum.en.title,
                        id: data[AppFirebaseKey.id],
                        educType: EducTypeEnum.reading.title,
                        exampleType: EducExamTypeEnum.word.title,
                      ));
                },
              );
            },
          );
        });
  }
}
