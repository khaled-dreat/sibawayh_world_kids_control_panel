part of '../../utils/import/app_import.dart';

class EditWords extends StatelessWidget {
  static const String nameRoute = "EditWords";
  const EditWords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(), body: const ListViwBuildEditWords());
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(),
        10.verticalSpace,
        const SizedBox(
          height: kTextTabBarHeight * 1.5,
          child: CustomTextField(
              icon: Icons.search,
              hintText: "اكتب اسم عن العنصر الذي تريد البحث عنه"),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + kTextTabBarHeight * 2);
}

class CustomTextField extends StatelessWidget {
  final IconData? icon;

  final String? hintText;

  const CustomTextField({
    super.key,
    this.icon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            suffixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            )));
  }
}
