part of '../utils/import/app_import.dart';

class ControllerEducationalMaterialsManager extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // * Save Education Material in Firestore
  void _saveEducationalMaterialsToMrssaheSubcollection({
    required String id,
    required String title,
    required String imageUrl,
    required String audioUrl,
    required String details,
    required String textSpeehcToText,
    required bool active,
    required DateTime timeSend,
    required String educType,
    required String lang,
    required String exampleType,
  }) async {
    final education = ModelEducation(
        id: id,
        title: title,
        image: imageUrl,
        audio: audioUrl,
        details: details,
        textSpeehcToText: textSpeehcToText,
        active: active,
        timeSend: timeSend,
        userId: auth.currentUser!.uid,
        educType: educType,
        exampleType: exampleType,
        lang: lang);
    await firestore
        .collection(AppFirebaseKey.education)
        .doc(educType)
        .collection(AppFirebaseKey.lang)
        .doc(lang)
        .collection(AppFirebaseKey.example)
        .doc(exampleType)
        .collection("id")
        .doc(id)
        .set(education.toMap());
  }

  // * Add Educational Materials to Firebase
  Future<void> addEducationalMaterials({
    required String title,
    required File audio,
    required File image,
    required String cardType,
    required String woedsEnum,
    required String educType,
    required String lang,
    required String exampleType,
  }) async {
    DateTime timeSend = DateTime.now();
    String cardID = const Uuid().v1();
    String imageUrl = await StoregFileToFirebase()
        .storageFileTOFirebase('materials/$cardType/$woedsEnum/image', image);
    String audioUrl = await StoregFileToFirebase()
        .storageFileTOFirebase('materials/$cardType/$woedsEnum/audio', audio);
    _saveEducationalMaterialsToMrssaheSubcollection(
        id: cardID,
        title: title,
        imageUrl: imageUrl,
        audioUrl: audioUrl,
        details: "details",
        textSpeehcToText: "textSpeehcToText",
        active: true,
        timeSend: timeSend,
        educType: educType,
        lang: lang,
        exampleType: exampleType);
  }

  ModelEducation? education;
  bool imgLoading = false;
  void changeImgLodaing(bool value) {
    imgLoading = value;
    notifyListeners();
  }

  Future<void> getEducationalMaterials({
    required String id,
    required String educType,
    required String lang,
    required String exampleType,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> educationalMaterialsData =
        await firestore
            .collection(AppFirebaseKey.education)
            .doc(educType)
            .collection(AppFirebaseKey.lang)
            .doc(lang)
            .collection(AppFirebaseKey.example)
            .doc(exampleType)
            .collection("id")
            .doc(id)
            .get();
    if (educationalMaterialsData.data() != null) {
      education = ModelEducation.fromMap(educationalMaterialsData.data()!);
      changeImgLodaing(true);
    }
  }

  bool isGetAllEducMatr = true;

  void changeIsGetAllEducMatr(bool value) {
    isGetAllEducMatr = value;
    notifyListeners();
  }

// * Get All Educational Materials
  List<ModelEducation> allWords = [];
  // List<ModelAllLetters> allLetters = [];
  // List<ModelAllSentence> allSentence = [];

  Future<void> getAllEducationalMaterials() async {
    allWords = [];
    changeIsGetAllEducMatr(true);
    firestore
        .collection(AppFirebaseKey.education)
        .doc(EducTypeEnum.reading.title)
        .collection(AppFirebaseKey.lang)
        .doc(EducLangEnum.ar.title)
        .collection(AppFirebaseKey.example)
        .doc(EducExamTypeEnum.word.title)
        .collection(AppFirebaseKey.id)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var document in value.docs) {
          allWords.add(ModelEducation.fromMap(document.data()));
          changeIsGetAllEducMatr(false);
        }
      } else {
        changeIsGetAllEducMatr(false);
      }
    });
  }
}
