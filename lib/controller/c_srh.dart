part of '../utils/import/app_import.dart';

class ControllerSrh extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // * Value Come From txtSrhCustom
  String srhValue = "";
  void changeSrhValue(String value) {
    srhValue = value;
    notifyListeners();
  }

  // *  Search Query
  Stream<QuerySnapshot<Object?>> srhQuery(String educaLang) {
    Stream<QuerySnapshot> usersStream = firestore
        .collection(AppFirebaseKey.education)
        .doc(EducTypeEnum.reading.title)
        .collection(AppFirebaseKey.lang)
        .doc(educaLang)
        .collection(AppFirebaseKey.example)
        .doc(EducExamTypeEnum.word.title)
        .collection(AppFirebaseKey.id)
        .orderBy(AppFirebaseKey.title)
        .startAt([srhValue]).endAt(["$srhValue\uf8ff"]).snapshots();
    srhValue = "";
    return usersStream;
  }
}
