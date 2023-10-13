part of '../../utils/import/app_import.dart';

class ControllerEducationManeg extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  ModelEducation? education;

// ? ************************ Get Education Material Data **********************

  // * Get Education Material Data by ID

  bool imgLoading = false;
  void changeImgLodaing(bool value) {
    imgLoading = value;
    notifyListeners();
  }

  String educaLang = "";
  void changeEducaLang(String value) {
    educaLang = value;
    changeEducaLangData(value);
  }

  String title = "";
  void changeTitle(String value) {
    title = value;
  }

  Future<void> getEducationByID({
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
            .collection(AppFirebaseKey.id)
            .doc(id)
            .get();
    if (educationalMaterialsData.data() != null) {
      education = ModelEducation.fromMap(educationalMaterialsData.data()!);
      changeOldLangEduc(education!.lang);
      changeOldContent(education!.textSpeehcToText);
      changeTitle(education!.title);
      changeImgLodaing(true);
    }
  }

// * Get All Education Materials

  bool isGetAllEducMatr = true;
  void changeIsGetAllEducMatr(bool value) {
    isGetAllEducMatr = value;
    notifyListeners();
  }

  List<ModelEducation> allEducation = [];

  Future<void> getAllEducation({
    required String exampleType,
  }) async {
    dev.log("start");

    allEducation = [];
    changeIsGetAllEducMatr(true);
    firestore
        .collection(AppFirebaseKey.education)
        .doc(EducTypeEnum.reading.title)
        .collection(AppFirebaseKey.lang)
        .doc(educaLang)
        .collection(AppFirebaseKey.example)
        .doc(exampleType)
        .collection(AppFirebaseKey.id)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var document in value.docs) {
          allEducation.add(ModelEducation.fromMap(document.data()));
          changeIsGetAllEducMatr(false);
        }
      } else {
        changeIsGetAllEducMatr(false);
      }
      dev.log("end");
    });
  }

// ? ************************ Save Education Data **********************

  // * Save Education Data in Firestore

  String educaLangData = "";
  void changeEducaLangData(String value) {
    educaLangData = value;
  }

  String oldLangEduc = "";
  void changeOldLangEduc(String value) {
    oldLangEduc = value;
  }

  void _saveEducationToMrssaheSubcollection({
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

  // * Add Education Data

  Future<void> addEducation(
      {required String title,
      required File audio,
      required File image,
      required String cardType,
      required String educType,
      required String exampleType,
      required BuildContext context}) async {
    try {
      DateTime timeSend = DateTime.now();
      String cardID = const Uuid().v1();
      String imageUrl = await StoregFileManagement()
          .storageFileTOFirebase('materials/$cardType/$title/image', image);
      String audioUrl = await StoregFileManagement()
          .storageFileTOFirebase('materials/$cardType/$title/audio', audio);

      await Future.delayed(
        Duration.zero,
        () {
          //  transcribe(convertAudioToList(audio), context);
        },
      );
      if (content.isNotEmpty) {
        _saveEducationToMrssaheSubcollection(
            id: cardID,
            title: title,
            imageUrl: imageUrl,
            audioUrl: audioUrl,
            details: "details",
            textSpeehcToText: content,
            active: true,
            timeSend: timeSend,
            educType: educType,
            lang: educaLangData,
            exampleType: exampleType);
        await Future.delayed(
          Duration.zero,
          () {
            Navigator.pop(context);
            fetchEducationData(exampleType: exampleType);
            AppSnackBar.snackBarSuccess(context, msg: "تمت عملية الحفظ بنجاح");
          },
        );
      } else {
        await Future.delayed(
          Duration.zero,
          () {
            Navigator.pop(context);
            fetchEducationData(exampleType: exampleType);
            AppSnackBar.snackBarError(context,
                msg: "الرجاء التأكد من جودة الصوت المختار");
          },
        );
      }
    } catch (e) {
      dev.log(e.toString());
    }
  }

  // ? ************************ Update Education Data **********************

  Future<void> fetchEducationData({
    required String exampleType,
  }) async {
    await getAllEducation(exampleType: exampleType);
  }

  // * Use To Save The Text Return From  Google Clude
  String content = "";
  String oldContent = "";

  // * Change Content Value
  void changeContent(String value) {
    content = value;
    notifyListeners();
  }

  void changeOldContent(String value) {
    content = value;
    notifyListeners();
  }

  List<int> convertAudioToList(File audio) {
    return audio.readAsBytesSync().toList();
  }

  // * Update Education Data in Firestore
  void _updateEducationInMrssaheSubcollection({
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

// * Update Education Data
  Future<void> updateEducation(
      {required String title,
      required String cardID,
      required File? audio,
      required File? image,
      required String cardType,
      required String educType,
      required String exampleType,
      required BuildContext context}) async {
    try {
      DateTime timeSend = DateTime.now();
      late String audioUrl;
      late String imageUrl;
      if (audio == null) {
        audioUrl = education!.audio;
        content = education!.textSpeehcToText;
      } else {
        //  await transcribe(convertAudioToList(audio), context);
        if (content.isNotEmpty) {
          audioUrl = await StoregFileManagement()
              .storageFileTOFirebase('materials/$cardType/$title/audio', audio);
        }
      }
      imageUrl = image == null
          ? education!.image
          : await StoregFileManagement()
              .storageFileTOFirebase('materials/$cardType/$title/image', image);
      if (content.isNotEmpty) {
        _updateEducationInMrssaheSubcollection(
            id: cardID,
            title: title,
            imageUrl: imageUrl,
            audioUrl: audioUrl,
            details: "details",
            textSpeehcToText: content,
            active: true,
            timeSend: timeSend,
            educType: educType,
            lang: educaLangData,
            exampleType: exampleType);

        await Future.delayed(
          Duration.zero,
          () {
            Navigator.pop(context);
            fetchEducationData(exampleType: exampleType);
            AppSnackBar.snackBarSuccess(context,
                msg: "تمت عملية التعديل بنجاح");
          },
        );
      } else {}
    } catch (e) {
      dev.log(e.toString());
    }
  }

  // ? ************************ Speech to Text Google Clude Service **********************

  // Future<void> transcribe(List<int> audio, BuildContext context) async {
  //   try {
  //     dev.log("Speech to Text start");
  //     final serviceAccount =
  //
  //     final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
  //     final config = RecognitionConfig(
  //         encoding: AudioEncoding.LINEAR16,
  //         model: RecognitionModel.basic,
  //         audioChannelCount: 2,
  //         enableAutomaticPunctuation: true,
  //         sampleRateHertz: 44100,
  //         languageCode: 'ar');
//
  //     await speechToText.recognize(config, audio).then((value) {
  //       dev.log("info ${value.results.toString()}");
//
  //       changeContent(value.results
  //           .map((e) => e.alternatives.first.transcript)
  //           .join('\n')
  //           .replaceAll(".", ""));
  //       dev.log(content);
  //     }).whenComplete(() {});
  //     dev.log("Speech to Text start");
  //   } catch (e) {
  //     dev.log("Error Speeth to text : $e");
  //   }
  // }

  // * Delete Education Materials
  Future<void> deleteEducation({
    required String educType,
    required String educaLang,
    required String exampleType,
    required String image,
    required String audio,
    required String id,
    required String title,
  }) async {
    await firestore
        .collection(AppFirebaseKey.education)
        .doc(educType)
        .collection(AppFirebaseKey.lang)
        .doc(educaLang)
        .collection(AppFirebaseKey.example)
        .doc(exampleType)
        .collection(AppFirebaseKey.id)
        .doc(id)
        .delete();
    StoregFileManagement().deleteFilefromFirebase(image);
    StoregFileManagement().deleteFilefromFirebase(audio);
    fetchEducationData(exampleType: exampleType);
  }
}
