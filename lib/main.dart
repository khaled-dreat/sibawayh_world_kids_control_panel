import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:sibawayh_world_kids/utils/import/app_import.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: providers, child: const AppStart()));
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ContollerPicker()),
  ChangeNotifierProvider(
      create: (_) => ControllerEducationalMaterialsManager()),
];
