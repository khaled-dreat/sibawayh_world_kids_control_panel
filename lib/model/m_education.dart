part of '../utils/import/app_import.dart';

class ModelEducation {
  final String id;
  final String title;
  final String image;
  final String audio;
  final String details;
  final String textSpeehcToText;
  final bool active;
  final DateTime timeSend;
  final String userId;
  ModelEducation({
    required this.id,
    required this.title,
    required this.image,
    required this.audio,
    required this.details,
    required this.textSpeehcToText,
    required this.active,
    required this.timeSend,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'audio': audio,
      'details': details,
      'textSpeehcToText': textSpeehcToText,
      'active': active,
      'timeSend': timeSend.millisecondsSinceEpoch,
      'userId': userId,
    };
  }

  factory ModelEducation.fromMap(Map<String, dynamic> map) {
    return ModelEducation(
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      audio: map['audio'] as String,
      details: map['details'] as String,
      textSpeehcToText: map['textSpeehcToText'] as String,
      active: map['active'] as bool,
      timeSend: DateTime.fromMillisecondsSinceEpoch(map['timeSend'] as int),
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelEducation.fromJson(String source) =>
      ModelEducation.fromMap(json.decode(source) as Map<String, dynamic>);
}
