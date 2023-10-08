part of '../../utils/import/app_import.dart';

class ControllerAddEducational extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  ControllerGetEducation pAddEduc = ControllerGetEducation();
}
