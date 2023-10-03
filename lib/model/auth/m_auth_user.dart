part of '../../utils/import/app_import.dart';

class ModelAuthUser {
  String? email;
  String? password;

  ModelAuthUser({this.email, this.password});

  void setEmail(String? value) => email = value;
  void setPass(String? value) => password = value;

  @override
  String toString() => 'ModelAuthUser(email: $email, password: $password)';
}
