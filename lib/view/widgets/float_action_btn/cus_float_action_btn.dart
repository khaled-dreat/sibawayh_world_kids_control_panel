part of '../../../utils/import/app_import.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.educType,
    required this.lang,
    required this.exampleType,
  });
  final String educType;
  final String lang;
  final String exampleType;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        AppRoutes.goMaterial(
            context,
            EditingWord(
              isEditing: true,
              educType: educType,
              exampleType: lang,
              lang: exampleType,
            ));
      },
      backgroundColor: Colors.green,
      label: const Text("أضف عنصر جديد"),
      icon: const Icon(Icons.add),
    );
  }
}
