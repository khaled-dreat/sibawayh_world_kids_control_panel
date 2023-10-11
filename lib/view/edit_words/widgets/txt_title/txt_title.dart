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
      padding: EdgeInsets.only(top: 40.r, left: 20.r, right: 20.r),
      child: SizedBox(
        width: 1.sw,
        child: TextField(
          focusNode: txtTitleFocusNode,
          controller: txtTitleController,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
          maxLines: 1,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            hintStyle: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp),
            hintText: "أكتب وصف المقرر",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.r, horizontal: 8.r),
          ),
        ),
      ),
    );
  }
}
//CustomTextField(
//         hintText: "أكتب وصف المقرر",
//         focusNode: txtTitleFocusNode,
//         controller: txtTitleController,
//       )