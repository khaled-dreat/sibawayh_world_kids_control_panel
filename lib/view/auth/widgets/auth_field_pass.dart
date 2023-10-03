part of '../../../utils/import/app_import.dart';

class AuthFieldPass extends StatelessWidget {
  final bool isConfirm;

  const AuthFieldPass({
    super.key,
    this.isConfirm = false,
  });

  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return CustomTextField(
      label: isConfirm ? "تأكيد كلمة المرور" : "كلمه السر",
      prefixIcon: AppIcons.pass,
      sufixicon: pAuth.icon,
      isPass: pAuth.isNotShowPass,
      validator: (value) {
        return isConfirm
            ? AppValidators.checkConfirmPass(value, pAuth.currentPass)
            : AppValidators.checkPass(value);
      },
      onChanged: isConfirm ? pAuth.setCurentPass : null,
      onSaved: pAuth.userAuth.setPass,
    );
  }
}
