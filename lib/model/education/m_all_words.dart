part of '../../utils/import/app_import.dart';

class ModelAllWords {
  final String wordId;
  final String tile;
  final String lang;
  final bool active;
  ModelAllWords({
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

  factory ModelAllWords.fromMap(Map<String, dynamic> map) {
    return ModelAllWords(
      wordId: map['wordId'] as String,
      tile: map['tile'] as String,
      lang: map['lang'] as String,
      active: map['active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelAllWords.fromJson(String source) =>
      ModelAllWords.fromMap(json.decode(source) as Map<String, dynamic>);
}
