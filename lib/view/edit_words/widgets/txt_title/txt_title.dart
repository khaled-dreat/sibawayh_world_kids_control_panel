part of '../../../../utils/import/app_import.dart';

class TxtTitle extends StatelessWidget {
  const TxtTitle({
    super.key,
    required this.txtTitleFocusNode,
    required this.txtTitleController,
  });

  final FocusNode txtTitleFocusNode;
  final TextEditingController txtTitleController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 63.r),
      child: SizedBox(
        width: 300.w,
        child: CustomTextField(
          hintText: "أكتب وصف المقرر",
          focusNode: txtTitleFocusNode,
          controller: txtTitleController,
        ),
      ),
    );
  }
}
