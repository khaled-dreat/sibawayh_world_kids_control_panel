part of '../../../utils/import/app_import.dart';

class CustomAppBarSrh extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarSrh({
    super.key,
    this.onChanged,
    this.controller,
  });
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.black38,
      title: Padding(
        padding: EdgeInsets.only(top: 8.r),
        child: CoustomTxtFieldSrh(onChanged: onChanged, controller: controller),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + 7.h);
}
