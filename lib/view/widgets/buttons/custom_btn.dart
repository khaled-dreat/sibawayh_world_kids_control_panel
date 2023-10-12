// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../../utils/import/app_import.dart';

class CustomBtn extends StatelessWidget {
  final Color colors;
  final String icon;

  const CustomBtn({
    Key? key,
    required this.colors,
    this.height,
    required this.title,
    required this.onTap,
    required this.icon,
    this.child,
  }) : super(key: key);

  final double? height;
  final String title;
  final Widget? child;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: colors.withAlpha(100),
      borderRadius: BorderRadius.circular(64.r),
      child: Container(
          width: 130.w,
          height: height ?? 70.h,
          margin: EdgeInsets.symmetric(
            horizontal: 8.r,
            vertical: 8.r,
          ),
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: child ??
              SvgPicture.asset(
                icon,
                height: 50.h,
              )),
    );
  }
}
