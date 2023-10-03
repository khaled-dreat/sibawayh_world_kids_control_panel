part of '../../utils/import/app_import.dart';

class PageRegister extends StatefulWidget {
  static const String nameRoute = "PageRegister";
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return Scaffold(
      appBar: AuthAppBar(title: AppLangKey.register),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: AppDime.md.r),
            child: Form(
              key: PageRegister.keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * logo
                  AuthAppLogo(width: 0.5.sw * 1.2),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Email
                  const AuthFieldEmail(),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Pass
                  const AuthFieldPass(),
                  // * Space
                  AppDime.lg.verticalSpace,

                  // * Confirm Pass
                  const AuthFieldPass(isConfirm: true),
                  // * Space
                  AppDime.lg.verticalSpace,

                  // * Button Sign in
                  pAuth.loading
                      ? const AppLoading(loading: TypeLoading.send)
                      : CustomAuthBtn(
                          title: AppLangKey.register,
                          onTap: () async {
                            if (PageRegister.keyForm.currentState?.validate() ??
                                false) {
                              // ✅
                              PageRegister.keyForm.currentState?.save();
                              if (await pAuth.authMethod(isSignIn: false) !=
                                  null) {
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
                    first: AppLangKey.haveAccount,
                    second: AppLangKey.login,
                    onTap: () {
                      Navigator.pop(context);
                    },
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
