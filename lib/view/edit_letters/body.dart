part of '../../utils/import/app_import.dart';

class EditLetters extends StatefulWidget {
  static const String nameRoute = "EditLetters";
  const EditLetters({super.key});

  @override
  State<EditLetters> createState() => _EditLettersState();
}

class _EditLettersState extends State<EditLetters> {
  @override
  Widget build(BuildContext context) {
    ControllerSrh pSrh = Provider.of<ControllerSrh>(context);

    return Scaffold(
        appBar: CustomAppBarSrh(
          onChanged: (value) {
            pSrh.changeSrhValue(value);
          },
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: pSrh.srhQuery("ar"),
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
                  QueryDocumentSnapshot<Object?> data =
                      snapshot.data!.docs[index];

                  return ListTile(
                    title: Text(data[AppFirebaseKey.title]),
                  );
                },
              );
            }));
  }
}
