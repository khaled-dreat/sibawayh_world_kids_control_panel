part of '../../utils/import/app_import.dart';

class ControllerWordManeg extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  ModelEducation? education;

// ? ************************ Get Word Material Data **********************

  // * Get Word Material Data by ID

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

  Future<void> getWordByID({
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
      changeOldContent(education!.textSpeehcToText);
      changeTitle(education!.title);
      changeImgLodaing(true);
    }
  }

// * Get All Word Materials

  bool isGetAllEducMatr = true;
  void changeIsGetAllEducMatr(bool value) {
    isGetAllEducMatr = value;
    notifyListeners();
  }

  List<ModelEducation> allWords = [];

  Future<void> getAllWord() async {
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

// ? ************************ Save Word Data **********************

  // * Save Word Data in Firestore

  String educaLangData = "";
  void changeEducaLangData(String value) {
    educaLangData = value;
  }

  String oldLangEduc = "";
  void changeOldLangEduc(String value) {
    oldLangEduc = value;
  }

  void _saveWordToMrssaheSubcollection({
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

  // * Add Word Data

  Future<void> addWord(
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
          transcribe(convertAudioToList(audio), context);
        },
      );
      if (content.isNotEmpty) {
        _saveWordToMrssaheSubcollection(
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
            fetchWordData();
            AppSnackBar.snackBarSuccess(context, msg: "تمت عملية الحفظ بنجاح");
          },
        );
      } else {
        await Future.delayed(
          Duration.zero,
          () {
            Navigator.pop(context);
            fetchWordData();
            AppSnackBar.snackBarError(context,
                msg: "الرجاء التأكد من جودة الصوت المختار");
          },
        );
      }
    } catch (e) {
      dev.log(e.toString());
    }
  }

  // ? ************************ Update Word Data **********************

  Future<void> fetchWordData() async {
    getAllWord();
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

  // * Update Word Data in Firestore
  void _updateWordInMrssaheSubcollection({
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

// * Update Word Data
  Future<void> updateWord(
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
        await transcribe(convertAudioToList(audio), context);
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
        _updateWordInMrssaheSubcollection(
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
            fetchWordData();
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

  Future<void> transcribe(List<int> audio, BuildContext context) async {
    try {
      dev.log("Speech to Text start");
      final serviceAccount =
          ServiceAccount.fromString(r'''{ "type": "service_account",
  "project_id": "angelic-gift-398808",
  "private_key_id": "44e3eddc0b16373f2564cff2b5741cba25722601",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCKWU5t4jcObjAY\nrJskk8EvE7Q1AXy7wQw210oaYcbd3vmzjQL1TBWbaL1KllMzRfEZyMVIBPwKZ2CK\n0Wd7Xo2zEK6Vx/x//TT2IpVlpq7kxYpLCkfsKiNXkcQeGbm1WMPWgGHyabnN+tJf\nwx6489iwAOHwl1kC/zZgfkkOILfr+jr0pxRKwfrqXcmoujWsh/Fcc7frjU5LJn3M\nCw0DmRWVQF/6kDWu/vKCMcRFPbm6JToUJq6y9wHxHyLOLuDZK0OnjbGO/GHiQF0P\nltCTXOclFQOatjXIoJA+A731/HgsOdNBiqOPJx1AiQc2oJQ51OjR7Z1fCSdUFM0k\nTQOld191AgMBAAECggEADArO/ViR80MbE6K+lFX6HEdqSazZ9xvMHN/rdtVo8noM\noRjWl5RqUw8wXtQr5MwjOtvTdDve1mb+K8cja0UlL1912tq/+0IGgKAtAd6a3ZXm\nPjbkYMWgMuigugACPqs9zKd7Hxcd0bSR6Dz7KR0skNFa2U7LNCwTxx1m7YBikfsi\nrnF8tfnEvy+3pwV8WAB0ZYPC+0l/ST5BTbPfLDBWFlYIdEkmnpLuINti0ZORadJf\nC3XdJzdAOOrIdOTU0B0uR0A/Pr2vDwU9IeIKWOyU1jwWHWt/lcZLHzhZ36BX0+8G\nI1QLjdYFSWXOGgsvvAwtt66ewxPpGACrKzwAD3IrBwKBgQDAUn7k/Y4hHYeQ+fjl\nkA2TLgNB1eVUuKbGZ+WXNWfvMB8PMVb1A2HI6Rd6TUkeUUQ4rSNk7+fs+T0L0RPx\nHSuQkRpYWqTjYSA7nqratvrfr9rI24RkjrBEHSzdjHjgE75CwM/CKrn6DnDr5KQJ\nslGC+0691tgcESUHOT1C0w8uwwKBgQC4J/MiJ4HE+rPaXPu56LL8Dz4njERBV40h\n6IZx1MQb+dL+EE3JvJM8Uj3S0n0IfOGYSTI/JR5/+DgxE57Xuks1rrG0fAkl7kZt\nGRcIJlfaUe9tMCq/vArHhD4oDx9RoGYcME1uWxatPZQZ+xHM3oiL963/yiFf0Dg4\nFtqPmCtFZwKBgG6ghYGvIEyIMe0A/Vz/ie95bkI2iZ48QSKrrPNXsxtxMMyKcxyo\n/1yUR/7/6elYkceQQGXVYjF8BNOBRtlREDguX1sneOWafvIMiPcafiChhVY4f2Vg\ndqAXsDEYloc+lBjN1DQ6Y5QlLmtir8EsI5sWd+rXZKRwcD5BfK2tvnQFAoGAB+9w\nwqABL4O+DELFdhVY4ROnEf0xU796DWP/pxgL+0igluIM+AxwK8E/eL4pNRxsfCtr\nRt1KmykPAs5dod4dL4r/jU9q9X92+WyDWY6NapLtRj81GF35+O7x3rgIGXRX8g8C\nxyaVq5FjuFrhQXq1V5KspMEI/x/xzDjv4hAkjTECgYBJ0faXACD65vNRS4qVoNUi\nNw82I0SqjFoYU6IDKwoEltY/Y5DSe9NM2dH8eW2Rcm75xzpV3OB3Q1BNbl/OFT4E\nhpkHzfINQj/IWwsZSRQ/pzuMwd9Tzd7/xXImAepyKJ3r6iL6kiOQiG8NbgiGlHHf\nUMGauvK1KbFKRtKX01WkHQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "mervat@angelic-gift-398808.iam.gserviceaccount.com",
  "client_id": "115138938632147223593",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/mervat%40angelic-gift-398808.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"}''');
      final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
      final config = RecognitionConfig(
          encoding: AudioEncoding.LINEAR16,
          model: RecognitionModel.basic,
          audioChannelCount: 2,
          enableAutomaticPunctuation: true,
          sampleRateHertz: 44100,
          languageCode: 'ar');

      await speechToText.recognize(config, audio).then((value) {
        dev.log("info ${value.results.toString()}");

        changeContent(value.results
            .map((e) => e.alternatives.first.transcript)
            .join('\n')
            .replaceAll(".", ""));
        dev.log(content);
      }).whenComplete(() {});
      dev.log("Speech to Text start");
    } catch (e) {
      dev.log("Error Speeth to text : $e");
    }
  }

  // ? ************************ Delete Word Data **********************

  // * Delete Word Materials
  Future<void> deleteWord({
    required String educType,
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
    fetchWordData();
  }
}
