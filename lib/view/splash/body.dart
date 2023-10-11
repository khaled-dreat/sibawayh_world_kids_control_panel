part of '../../utils/import/app_import.dart';

class PageSplash extends StatefulWidget {
  static const String nameRoute = 'PageSplash';

  const PageSplash({super.key});

  @override
  State<PageSplash> createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      if (await AppLang.showSelectLang) {
        AppRoutes.goReplace(context, PageSelectedLang.nameRoute);
      } else {
        // wrapper
        AppRoutes.goReplace(context, Wrapper.nameRoute);
      }
    });

    // todo : add  pApi.initRequest(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(AppImages.appLogoSplash),
              width: AppDime.fullScreen.sw,
            ),
            AppDime.lg.verticalSpace,
            // * Name
          ],
        ),
      ),
    );
  }
}
