part of "../utils/import/app_import.dart";

class AppStart extends StatelessWidget {
  const AppStart({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // * Language

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // * Route

        routes: AppRoutes.routes,
        initialRoute: AppRoutes.initRoute,
      ),
    );
  }
}
