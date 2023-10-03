part of '../../utils/import/app_import.dart';

class EditIn extends StatelessWidget {
  static const String nameRoute = "EditIn";
  const EditIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 50.r),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomCard(
            icon: AppIcons.editingwriting,
            title: "تعديل على الكتابة",
          ),
          CustomCard(
            onTap: () {
              AppRoutes.go(context, CurriculumModification.nameRoute);
            },
            icon: AppIcons.editingReading,
            title: "تعديل على القرائة",
          ),
        ]),
      ),
    );
  }
}
