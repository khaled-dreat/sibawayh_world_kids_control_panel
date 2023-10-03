part of '../../utils/import/app_import.dart';

class HomePage extends StatelessWidget {
  static const String nameRoute = "HomePage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 50.r),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomCard(
            onTap: () {
              AppRoutes.go(context, EditIn.nameRoute);
            },
            icon: AppIcons.curriculumModification,
            title: "تعديل على المنهج الدراسي",
          ),
          CustomCard(
            icon: AppIcons.technicalSupport,
            title: "الدعم الفني",
          ),
        ]),
      ),
    );
  }
}
