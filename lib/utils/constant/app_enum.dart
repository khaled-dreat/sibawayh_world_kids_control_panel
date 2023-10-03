part of '../import/app_import.dart';

enum EducTypeEnum {
  writing("writing"),
  reading("reading");

  final String title;
  const EducTypeEnum(this.title);
}

enum EducLangEnum {
  ar("ar"),
  en("en");

  final String title;
  const EducLangEnum(this.title);
}

enum EducExamTypeEnum {
  word("word"),
  letter("letter"),
  sentence("sentence");

  final String title;
  const EducExamTypeEnum(this.title);
}
