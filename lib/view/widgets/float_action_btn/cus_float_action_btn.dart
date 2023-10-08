part of '../../../utils/import/app_import.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.educType,
    required this.exampleType,
  });
  final String educType;
  final String exampleType;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        AppRoutes.goMaterial(
            context,
            AddWord(
              educType: educType,
              exampleType: exampleType,
            ));
      },
      backgroundColor: Colors.green,
      label: const Text("أضف عنصر جديد"),
      icon: const Icon(Icons.add),
    );
  }
}
