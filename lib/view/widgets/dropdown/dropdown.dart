part of '../../../utils/import/app_import.dart';

class DropDownSelectLang extends StatelessWidget {
  const DropDownSelectLang({
    Key? key,
    this.isEditing = true,
  }) : super(key: key);
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    ControllerEducationManeg pEduc =
        Provider.of<ControllerEducationManeg>(context);
    return Container(
      width: 1.sw,
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: DropdownButtonFormField(
        iconSize: 35.r,
        decoration: InputDecoration(
            hintText: "أختر لغة المقرر",
            hintStyle: TextStyle(fontSize: 20.sp),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: Colors.blue),
            )),
        value: isEditing ? pEduc.educaLangData : null,
        items: [
          DropdownMenuItem(
            value: EducLangEnum.ar.title,
            child:
                Text(AppLangKey.arabic.tr(), style: TextStyle(fontSize: 20.sp)),
          ),
          DropdownMenuItem(
            value: EducLangEnum.en.title,
            child: Text(AppLangKey.english.tr(),
                style: TextStyle(fontSize: 20.sp)),
          ),
        ],
        onChanged: (value) {
          pEduc.changeEducaLangData(value!);
        },
      ),
    );
  }
}
