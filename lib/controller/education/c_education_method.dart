part of '../../utils/import/app_import.dart';

class ControllerEducationData extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  ModelEducation? education;
  List<ModelEducation> allWords = [];

  Future<void> fetchDataEduc() async {
    getEducationalMaterials();
  }

  bool imgLoading = false;
  void changeImgLodaing(bool value) {
    imgLoading = value;
    notifyListeners();
  }

  String title = "";
  void changeTitle(String value) {
    title = value;
  }

  String educaLang = "";
  void changeEducaLang(String value) {
    educaLang = value;
    changeEducaLangData(value);
  }

  String educaLangData = "";
  void changeEducaLangData(String value) {
    educaLangData = value;
  }

  String oldLangEduc = "";
  void changeOldLangEduc(String value) {
    oldLangEduc = value;
  }

  bool isGetAllEducMatr = true;
  void changeIsGetAllEducMatr(bool value) {
    isGetAllEducMatr = value;
    notifyListeners();
  }

  // * Get Educational Material Data by ID
  Future<void> getEducationalMaterialByID({
    required String id,
    required String educType,
    required String exampleType,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> educationalMaterialsData =
        await firestore
            .collection(AppFirebaseKey.education)
            .doc(educType)
            .collection(AppFirebaseKey.lang)
            .doc(educaLang)
            .collection(AppFirebaseKey.example)
            .doc(exampleType)
            .collection("id")
            .doc(id)
            .get();
    if (educationalMaterialsData.data() != null) {
      education = ModelEducation.fromMap(educationalMaterialsData.data()!);
      changeOldLangEduc(education!.lang);
      changeTitle(education!.title);
      //   changeEducaLang(education!.lang);
      changeImgLodaing(true);
    }
  }

// * Get All Educational Materials
  Future<void> getEducationalMaterials() async {
    allWords = [];
    changeIsGetAllEducMatr(true);
    firestore
        .collection(AppFirebaseKey.education)
        .doc(EducTypeEnum.reading.title)
        .collection(AppFirebaseKey.lang)
        .doc(educaLang)
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

  // * Save Education Material Data in Firestore
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
        lang: educaLang);
    await firestore
        .collection(AppFirebaseKey.education)
        .doc(educType)
        .collection(AppFirebaseKey.lang)
        .doc(educaLangData)
        .collection(AppFirebaseKey.example)
        .doc(exampleType)
        .collection(AppFirebaseKey.id)
        .doc(id)
        .set(education.toMap());
  }

  // * Update Education Material Data in Firestore
  void _updateEducationalMaterialsToMrssaheSubcollection({
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
    if (oldLangEduc == educaLangData) {
      await firestore
          .collection(AppFirebaseKey.education)
          .doc(educType)
          .collection(AppFirebaseKey.lang)
          .doc(oldLangEduc)
          .collection(AppFirebaseKey.example)
          .doc(exampleType)
          .collection(AppFirebaseKey.id)
          .doc(id)
          .update(education.toMap());
    } else {
      await firestore
          .collection(AppFirebaseKey.education)
          .doc(educType)
          .collection(AppFirebaseKey.lang)
          .doc(oldLangEduc)
          .collection(AppFirebaseKey.example)
          .doc(exampleType)
          .collection(AppFirebaseKey.id)
          .doc(id)
          .delete();
      await firestore
          .collection(AppFirebaseKey.education)
          .doc(educType)
          .collection(AppFirebaseKey.lang)
          .doc(lang)
          .collection(AppFirebaseKey.example)
          .doc(exampleType)
          .collection(AppFirebaseKey.id)
          .doc(id)
          .set(education.toMap());
    }
  }

// * Update Education Materila
  Future<void> updateEducationalMaterial(
      {required String title,
      required String cardID,
      required File? audio,
      required File? image,
      required String cardType,
      required String educType,
      required String exampleType,
      required BuildContext context}) async {
    DateTime timeSend = DateTime.now();
    String imageUrl = image == null
        ? education!.image
        : await StoregFileToFirebase()
            .storageFileTOFirebase('materials/$cardType/$title/image', image);
    String audioUrl = audio == null
        ? education!.audio
        : await StoregFileToFirebase()
            .storageFileTOFirebase('materials/$cardType/$title/audio', audio);
    _updateEducationalMaterialsToMrssaheSubcollection(
        id: cardID,
        title: title,
        imageUrl: imageUrl,
        audioUrl: audioUrl,
        details: "details",
        textSpeehcToText: "textSpeehcToText",
        active: true,
        timeSend: timeSend,
        educType: educType,
        lang: educaLangData,
        exampleType: exampleType);
    Navigator.pop(context);
    fetchDataEduc();
    AppSnackBar.snackBarSuccess(context, msg: "تمت عملية الحفظ بنجاح");
  }

  // * Add Educational Materials
  Future<void> addEducationalMaterials(
      {required String title,
      required File audio,
      required File image,
      required String cardType,
      required String educType,
      required String exampleType,
      required BuildContext context}) async {
    DateTime timeSend = DateTime.now();
    String cardID = const Uuid().v1();
    String imageUrl = await StoregFileToFirebase()
        .storageFileTOFirebase('materials/$cardType/$title/image', image);
    String audioUrl = await StoregFileToFirebase()
        .storageFileTOFirebase('materials/$cardType/$title/audio', audio);
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
        lang: educaLangData,
        exampleType: exampleType);
    Navigator.pop(context);
    fetchDataEduc();
    AppSnackBar.snackBarSuccess(context, msg: "تمت عملية الحفظ بنجاح");
  }
}
