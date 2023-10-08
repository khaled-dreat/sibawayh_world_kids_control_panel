part of '../../../utils/import/app_import.dart';

class CustomAppBarSrh extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarSrh({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(text: AppLangKey.arabic.tr()),
          Tab(text: AppLangKey.english.tr()),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + kTextTabBarHeight);
}
 // SizedBox(
 //       height: 50,
 //       child: CustomTextField(
 //           sufixicon: Icons.search,
 //           hintText: "اكتب اسم عن العنصر الذي تريد البحث عنه"),
 //     ),