part of '../../../utils/import/app_import.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String icon;

  const CustomCard({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            20.verticalSpace,
            SvgPicture.asset(icon, height: 70.h),
            15.verticalSpace,
            Text(title),
          ],
        ));
  }
}
