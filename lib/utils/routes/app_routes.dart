part of '../import/app_import.dart';

class AppRoutes {
  // * Pages  App
  static Map<String, WidgetBuilder> routes = {
    HomePage.nameRoute: (context) => const HomePage(),
    CurriculumModification.nameRoute: (context) =>
        const CurriculumModification(),
    EditIn.nameRoute: (context) => const EditIn(),
    EditWords.nameRoute: (context) => const EditWords(),
    EditingWord.nameRoute: (context) => const EditingWord(),
  };

  // * inti Route
  static String? get initRoute => EditingWord.nameRoute;

  // * push Name
  static void go(BuildContext context, String nameRoute) =>
      Navigator.pushNamed(context, nameRoute);
  // * push Name Replace
  static void goReplace(BuildContext context, String nameRoute) =>
      Navigator.pushReplacementNamed(context, nameRoute);

  // * push Name
  static void goMaterial(BuildContext context, Widget page) {
    MaterialPageRoute<Widget> route =
        MaterialPageRoute(builder: (context) => page);
    Navigator.push(context, route);
  }
}
