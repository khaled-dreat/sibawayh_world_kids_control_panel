part of '../../../utils/import/app_import.dart';

class Letters extends StatefulWidget {
  static const String nameRoute = "Letters";
  const Letters({super.key});

  @override
  State<Letters> createState() => _LettersState();
}

class _LettersState extends State<Letters> {
  TextEditingController txtSrhController = TextEditingController();

  int currentIndex = 0;
  List<Widget> tabs = const [TabArLetter(), TabEnLetters()];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppIcons.bottomNavBarWords, height: 28),
        label: AppLangKey.arabic.tr()),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppIcons.bottomNavBarWords, height: 28),
        label: AppLangKey.english.tr())
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        AppConnectivityManager pConnectivity =
            Provider.of<AppConnectivityManager>(context, listen: false);
        pConnectivity.checkConnectitivy();
      },
    );
  }

  @override
  void dispose() {
    txtSrhController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ControllerSrh pSrh = Provider.of<ControllerSrh>(context);
    AppConnectivityManager pConnectivity =
        Provider.of<AppConnectivityManager>(context);
    return Scaffold(
      appBar: CustomAppBarSrh(
        controller: txtSrhController,
        onChanged: (value) {
          pSrh.changeSrhValue(value);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        iconSize: 30,
        selectedFontSize: 15.sp,
        unselectedFontSize: 13.sp,
        items: items,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
            txtSrhController.text = "";
          });
        },
      ),
      body: Center(child: tabs[currentIndex]),
      floatingActionButton: CustomFloatingActionButton(
        isconnect: pConnectivity.isconnect,
        educType: EducTypeEnum.reading.title,
        exampleType: EducExamTypeEnum.letter.title,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
/*
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
}*/

