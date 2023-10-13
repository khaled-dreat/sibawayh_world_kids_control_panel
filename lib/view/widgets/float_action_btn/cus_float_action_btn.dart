part of '../../../utils/import/app_import.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.educType,
    required this.exampleType,
    required this.isconnect,
  });
  final String educType;
  final String exampleType;
  final bool isconnect;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        isconnect
            ? AppRoutes.goMaterial(
                context,
                AddMaterialReading(
                  educType: educType,
                  exampleType: exampleType,
                ))
            : AppToast.toast("الرجاء التأكد من حالة الاتصال بل انترنت");
      },
      backgroundColor: Colors.green,
      label: const Text("أضف عنصر جديد"),
      icon: const Icon(Icons.add),
    );
  }
}
