part of '../../utils/import/app_import.dart';

class PageSignIn extends StatelessWidget {
  static const String nameRoute = "PageSignIn";
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  const PageSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.r),
              child: Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      // * logo
                      AuthAppLogo(width: 0.5.sw * 2),
                      // * Space
                      25.verticalSpace,
                      // * Email
                      const AuthFieldEmail(),
                      // * Space
                      25.verticalSpace,
                      // * Pass
                      const AuthFieldPass(),
                      // * Forgot Pass
                      const AuthForgotPass(),
                      // * Button Sign in

                      pAuth.loading
                          ? const AppLoading(
                              loading: TypeLoading.send,
                            )
                          : CustomAuthBtn(
                              title: "تسجيل الدخول",
                              onTap: () async {
                                if (keyForm.currentState?.validate() ?? false) {
                                  keyForm.currentState?.save();
                                  if (await pAuth.authMethod() != null) {
                                    AppRoutes.goReplace(
                                        context, HomePage.nameRoute);
                                  } else {
                                    AppToast.toast(pAuth.errorMessage);
                                  }
                                }
                              },
                            ),

                      // * Space
                      AppDime.lg.verticalSpace,
                      // * Footer
                      AuthFooter(
                        first: AppLangKey.notAccount,
                        second: AppLangKey.register,
                        onTap: () =>
                            AppRoutes.go(context, PageRegister.nameRoute),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }
}
