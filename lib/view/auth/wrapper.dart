part of '../../utils/import/app_import.dart';

class Wrapper extends StatelessWidget {
  static const String nameRoute = 'Wrapper';
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context, listen: false);
    return Scaffold(
      body: StreamBuilder(
        stream: pAuth.currentUser,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoading(loading: TypeLoading.page);
          }
          return snapshot.hasData ? HomePage() : PageSignIn();
        },
      ),
    );
  }
}
