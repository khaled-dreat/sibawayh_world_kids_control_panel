part of '../utils/import/app_import.dart';

class StoregFileToFirebase {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Future<String> storageFileTOFirebase(String path, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(path).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downlodeUrl = await snap.ref.getDownloadURL();
    return downlodeUrl;
  }
}
