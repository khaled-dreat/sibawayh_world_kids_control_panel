import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sibawayh_world_kids/utils/import/app_import.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: const AppStart()));
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ContollerPicker()),
];
