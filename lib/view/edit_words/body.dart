part of '../../utils/import/app_import.dart';

class EditWords extends StatefulWidget {
  static const String nameRoute = "EditWords";
  const EditWords({super.key});

  @override
  State<EditWords> createState() => _EditWordsState();
}

class _EditWordsState extends State<EditWords> {
  TextEditingController txtSrhController = TextEditingController();

  int currentIndex = 0;
  List<Widget> tabs = const [TabAr(), TabEn()];
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
        exampleType: EducExamTypeEnum.word.title,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
