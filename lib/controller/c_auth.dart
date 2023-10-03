part of '../utils/import/app_import.dart';

class ControllerAuth extends ChangeNotifier {
  // ******************** Auth Icons ********************
  IconData icon = AppIcons.showPass;
  bool isNotShowPass = true;
  void changeIcon() {
    if (isNotShowPass) {
      isNotShowPass = false;
      icon = AppIcons.noShowPass;
    } else {
      isNotShowPass = true;
      icon = AppIcons.showPass;
    }
    ChangeNotifier();
  }

  // *************** Auth User ***********
  ModelAuthUser userAuth = ModelAuthUser();
  String currentPass = "";
  void setCurentPass(String value) {
    currentPass = value;
  }

  // *************** Firebase Auth ***********
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool loading = false;
  String errorMessage = '';

  set changeLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  set updateMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }

  Future<User?> authMethod({isSignIn = true}) async {
    try {
      changeLoading = true;
      UserCredential resultUser = isSignIn
          ? await firebaseAuth.signInWithEmailAndPassword(
              email: userAuth.email!, password: userAuth.password!)
          : await firebaseAuth.createUserWithEmailAndPassword(
              email: userAuth.email!, password: userAuth.password!);

      if (resultUser.user != null) {
        changeLoading = false;
        return resultUser.user;
      } else {
        changeLoading = false;
        updateMessage = "ليس لديك حساب؟";
        return null;
      }
    } on SocketException {
      changeLoading = false;
      updateMessage = loc.tr(AppLangKey.noInternet);
      return null;
    } on FirebaseAuthException catch (error) {
      changeLoading = false;
      updateMessage = error.message ?? '';
      return null;
    } catch (error) {
      changeLoading = false;
      updateMessage = error.toString();
      return null;
    }
  }

  // * Forgot pass
  Future<void> resetPass() async {
    try {
      changeLoading = true;
      await firebaseAuth.sendPasswordResetEmail(email: userAuth.email!);
      changeLoading = false;
    } on SocketException {
      changeLoading = false;
      updateMessage = AppLangKey.noInternet.tr();
    } on FirebaseAuthException catch (error) {
      changeLoading = false;
      updateMessage = error.message ?? '';
    } catch (e) {
      changeLoading = false;
      updateMessage = e.toString();
    }
  }

  // * signOut
  Future<void> signOut() async {
    firebaseAuth.signOut();
  }

  // * user state
  Stream<User?> get currentUser => firebaseAuth.authStateChanges();
}
