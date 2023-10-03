part of '../../utils/import/app_import.dart';

class PageForgotPass extends StatelessWidget {
  static const String nameRoute = 'PageForgotPass';
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  const PageForgotPass({super.key});
  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return Scaffold(
      appBar: AuthAppBar(title: AppLangKey.forgotPass),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: AppDime.md.r),
            child: Form(
              key: keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * logo
                  AuthAppLogo(width: 0.5.sw * 2),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * hint Reset pass
                  Text(
                    AppLangKey.hintResetPass.tr(),
                    textAlign: TextAlign.center,
                    style: AppTheme.s1(context)?.copyWith(height: 1.5),
                  ),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Email
                  const AuthFieldEmail(),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Button Sign in
                  pAuth.loading
                      ? const AppLoading(loading: TypeLoading.send)
                      : CustomAuthBtn(
                          title: AppLangKey.send,
                          onTap: () {
                            if (keyForm.currentState?.validate() ?? false) {
                              // ✅

                              keyForm.currentState?.save();
                              pAuth.resetPass();
                              Navigator.pop(context);
                            }
                          },
                        ),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Footer
                  AuthFooter(
                    first: AppLangKey.haveAccount,
                    second: AppLangKey.login,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
