part of '../../../utils/import/app_import.dart';

class AppDialog {
  static void saveEducData(BuildContext context,
      {required void Function()? btnOkOnPress,
      void Function()? btnCancelOnPress}) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AppLang.currentLang(context) == kEn
          ? AnimType.leftSlide
          : AnimType.rightSlide,
      title: "تأكيد عملية الحفظ",
      desc: "هل أنت متأكد من أنك تريد أتمام عملية الحفظ",
      btnOkOnPress: btnOkOnPress,
      btnOkText: AppLangKey.ok.tr(),
      btnCancelOnPress: btnCancelOnPress,
      btnCancelText: AppLangKey.exit.tr(),
      dismissOnTouchOutside: false,
    ).show();
  }
}
