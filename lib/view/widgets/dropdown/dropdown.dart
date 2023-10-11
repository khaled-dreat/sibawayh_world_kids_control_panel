part of '../../../utils/import/app_import.dart';

class DropDownSelectLang extends StatelessWidget {
  const DropDownSelectLang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ControllerEducationData pEduc =
        Provider.of<ControllerEducationData>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: SizedBox(
        width: 1.sw,
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
    );
  }
}
