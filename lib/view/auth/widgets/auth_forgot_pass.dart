part of '../../../utils/import/app_import.dart';

class AuthForgotPass extends StatelessWidget {
  const AuthForgotPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
          onPressed: () {
            AppRoutes.go(context, PageForgotPass.nameRoute);
          },
          child: Text(
            "هل نسيت كلمة السر؟",
            style: AppTheme.b1(context)?.copyWith(
              color: AppTheme.colorAuth(context),
              decoration: TextDecoration.underline,
            ),
          )),
    );
  }
}
