part of '../../../utils/import/app_import.dart';

class CoustomTxtFieldSrh extends StatelessWidget {
  const CoustomTxtFieldSrh({
    super.key,
    required this.onChanged,
    this.controller,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      maxLines: 1,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 17.sp),
        prefixIcon: Icon(Icons.search, color: Colors.black.withOpacity(.6)),
        hintText: 'أدخل اسم العنصر الذي تريد البحث عنه',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 8.r),
      ),
    );
  }
}
