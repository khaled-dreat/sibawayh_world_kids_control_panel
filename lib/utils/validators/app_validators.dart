part of '../import/app_import.dart';

class AppValidators {
  // * message Error
  static const String messageEnterValue = ".الرجاء إدخال قيمة";
  static const String messageCorrectEmail =
      ".يرجى كتابة عنوان بريد إلكتروني بالطريقة الصحيحة";
  static const String messageCorrectPass =
      ".كلمة مرور لا تقل عن ٦ أحرف ولا تزيد عن ١٢";
  static const String messageTitleEduc = "الرجاء أدخل وصف المقرر";
  static const String messageConfirmPass =
      "كلمة المرور وتأكيد كلمة المرور غير متطابقين.";

  static String? isEmail(String? value) => templateValidator(
      value, !validators.isEmail(value ?? ''), messageCorrectEmail);

  static String? checkPass(String? value) => templateValidator(
      value, !validators.isLength(value ?? '', 6, 12), messageCorrectPass);

  static String? checkConfirmPass(String? value, String? pass) =>
      templateValidator(
          value, !validators.equals(value?.trim(), pass), messageConfirmPass);

  static String? checkTitleEducation(String? value) => templateValidator(
      value, !validators.isLength(value ?? '', 0), messageTitleEduc);

  // * validator
  static String? templateValidator(
      String? value, bool condition, String errorMsg) {
    if (value?.isEmpty ?? true) {
      return messageEnterValue;
    } else if (condition) {
      return errorMsg;
    }
    return null;
  }
}
