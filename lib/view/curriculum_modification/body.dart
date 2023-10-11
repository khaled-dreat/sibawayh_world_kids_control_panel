part of '../../utils/import/app_import.dart';

class CurriculumModification extends StatelessWidget {
  static const String nameRoute = "CurriculumModification";

  const CurriculumModification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 50.r),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              CustomCard(
                onTap: () {
                  AppRoutes.go(context, EditWords.nameRoute);
                },
                icon: AppIcons.editWords,
                title: "تعديل على الحروف",
              ),
              CustomCard(
                icon: AppIcons.editLetters,
                title: "تعديل على الكلمات",
                onTap: () => AppRoutes.go(context, EditLetters.nameRoute),
              ),
            ]),
            20.verticalSpace,
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              CustomCard(
                icon: AppIcons.editSentence,
                title: "تعديل على الجمال",
              ),
              SizedBox(
                height: 150.h,
                width: 150.w,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
