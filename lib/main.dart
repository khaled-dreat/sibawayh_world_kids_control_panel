import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:sibawayh_world_kids/utils/import/app_import.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
      supportedLocales: AppLangConfig.supportLocale,
      path: AppLangConfig.path,
      fallbackLocale: AppLangConfig.enLocale,
      child: MultiProvider(providers: providers, child: const AppStart())));
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ContollerPicker()),
  ChangeNotifierProvider(create: (_) => ControllerAuth()),
  ChangeNotifierProvider(create: (_) => ControllerEducationManeg()),
  ChangeNotifierProvider(create: (_) => ControllerSrh()),
  ChangeNotifierProvider(create: (_) => AppConnectivityManager()),
];
