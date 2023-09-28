part of '../utils/import/app_import.dart';

class ControllerEducationalMaterialsManager extends ChangeNotifier {
  FirebaseFirestore? firestore;
  FirebaseStorage? firebaseStorage;

  void _saveEducationalMaterialsToMrssaheSubcollection({
    required String id,
    required String title,
    required String imageUrl,
    required String audioUrl,
    required String details,
    required String textSpeehcToText,
    required bool active,
    required DateTime timeSend,
    required String userId,
  }) {
    final education = ModelEducation(
        id: id,
        title: title,
        image: imageUrl,
        audio: audioUrl,
        details: details,
        textSpeehcToText: textSpeehcToText,
        active: active,
        timeSend: timeSend,
        userId: userId);
  }

  Future<void> addEducationalMaterials({
    //  required String title,
    required File audio,
    required File image,
    required String cardType,
    required String wrorsEnum,
  }) async {
    DateTime timesend = DateTime.now();
    String cardID = Uuid().v1();
    String imageUrl = await StoregFileToFirebase().storageFileTOFirebase(
        'materials/${cardType}/${wrorsEnum}/image', image);
    String audioUrl = await StoregFileToFirebase().storageFileTOFirebase(
        'materials/${cardType}/${wrorsEnum}/audio', audio);
  }
}
