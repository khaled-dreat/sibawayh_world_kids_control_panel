part of '../utils/import/app_import.dart';

class ContollerPicker extends ChangeNotifier {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedfile;
  bool isLoding = false;
  File? fileToDisplay;

  void changeIsLoding(bool value) {
    isLoding = value;
    ChangeNotifier();
  }

  void changeFileToDisplay(File value) {
    fileToDisplay = value;
    ChangeNotifier();
  }

  Future<void> pickFile({required FileType fileType}) async {
    try {
      changeIsLoding(true);
      result = await FilePicker.platform
          .pickFiles(type: fileType, allowMultiple: false);
      if (result != null) {
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
        dev.log("File Name $fileToDisplay");
      }
      changeIsLoding(false);
      changeFileToDisplay(fileToDisplay!);
    } catch (e) {
      dev.log("Peicer Error $e");
    }
  }
}
