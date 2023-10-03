part of '../../utils/import/app_import.dart';

class ModelAllSentence {
  final String wordId;
  final String tile;
  final String lang;
  final bool active;
  ModelAllSentence({
    required this.wordId,
    required this.tile,
    required this.lang,
    required this.active,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wordId': wordId,
      'tile': tile,
      'lang': lang,
      'active': active,
    };
  }

  factory ModelAllSentence.fromMap(Map<String, dynamic> map) {
    return ModelAllSentence(
      wordId: map['wordId'] as String,
      tile: map['tile'] as String,
      lang: map['lang'] as String,
      active: map['active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelAllSentence.fromJson(String source) =>
      ModelAllSentence.fromMap(json.decode(source) as Map<String, dynamic>);
}
