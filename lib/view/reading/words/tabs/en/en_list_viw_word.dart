part of '../../../../../utils/import/app_import.dart';

class EnListViewBuilderWord extends StatelessWidget {
  const EnListViewBuilderWord({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerSrh pSrh = Provider.of<ControllerSrh>(
      context,
    );
    AppConnectivityManager pConnectivity =
        Provider.of<AppConnectivityManager>(context);
    return StreamBuilder<QuerySnapshot>(
        stream: pSrh.srhQuery(
            educaLang: EducLangEnum.en.title,
            example: EducExamTypeEnum.word.title),
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
                  pConnectivity.isconnect
                      ? AppRoutes.goMaterial(
                          context,
                          EditMaterialReading(
                            educLang: EducLangEnum.en.title,
                            id: data[AppFirebaseKey.id],
                            educType: EducTypeEnum.reading.title,
                            exampleType: EducExamTypeEnum.word.title,
                          ))
                      : AppToast.toast(
                          "الرجاء التأكد من حالة الاتصال بل انترنت");
                },
              );
            },
          );
        });
  }
}
