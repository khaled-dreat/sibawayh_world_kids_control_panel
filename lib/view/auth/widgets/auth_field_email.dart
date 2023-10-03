part of '../../../utils/import/app_import.dart';

class AuthFieldEmail extends StatelessWidget {
  const AuthFieldEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return CustomTextField(
      validator: AppValidators.isEmail,
      onSaved: pAuth.userAuth.setEmail,
      label: "البريد الاكتروني",
      sufixicon: AppIcons.mail,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
