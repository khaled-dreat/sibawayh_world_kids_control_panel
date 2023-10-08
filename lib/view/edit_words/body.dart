part of '../../utils/import/app_import.dart';

class EditWords extends StatelessWidget {
  static const String nameRoute = "EditWords";
  const EditWords({super.key});
  final List<Widget> tabs = const [TabAr(), TabEn()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: const CustomAppBarSrh(),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(), children: tabs),
        floatingActionButton: CustomFloatingActionButton(
          educType: EducTypeEnum.reading.title,
          exampleType: EducExamTypeEnum.word.title,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
