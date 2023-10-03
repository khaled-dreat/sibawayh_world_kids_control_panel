part of '../../../utils/import/app_import.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String icon;

  final void Function()? onTap;

  const CustomCard({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: 150.w,
      child: InkWell(
        onTap: onTap,
        child: Card(
            color: Colors.grey.shade100,
            child: Column(
              children: [
                20.verticalSpace,
                SvgPicture.asset(icon, height: 70.h),
                15.verticalSpace,
                Text(title),
              ],
            )),
      ),
    );
  }
}
