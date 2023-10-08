part of '../../../utils/import/app_import.dart';

class DropDownSelectLang extends StatelessWidget {
  const DropDownSelectLang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ControllerEducationData pEduc =
        Provider.of<ControllerEducationData>(context);
    return Column(
      children: [
        Text("أختر لغة المقرر : ", style: TextStyle(fontSize: 18.sp)),
        13.verticalSpace,
        SizedBox(
          width: 130.w,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: Colors.blue),
            )),
            value: pEduc.educaLangData,
            items: [
              DropdownMenuItem(
                value: EducLangEnum.ar.title,
                child: Text(AppLangKey.arabic.tr()),
              ),
              DropdownMenuItem(
                value: EducLangEnum.en.title,
                child: Text(AppLangKey.english.tr()),
              ),
            ],
            onChanged: (value) {
              pEduc.changeEducaLangData(value!);
            },
          ),
        ),
      ],
    );
  }
}
