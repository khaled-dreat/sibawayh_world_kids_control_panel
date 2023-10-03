part of '../../../utils/import/app_import.dart';

class CustomAppBarSrh extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarSrh({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(),
        10.verticalSpace,
        const SizedBox(
          height: kTextTabBarHeight * 1.5,
          child: CustomTextField(
              sufixicon: Icons.search,
              hintText: "اكتب اسم عن العنصر الذي تريد البحث عنه"),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + kTextTabBarHeight * 2);
}
