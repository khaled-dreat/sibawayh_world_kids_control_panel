part of '../../../utils/import/app_import.dart';

class AuthAppLogo extends StatelessWidget {
  final double width;

  const AuthAppLogo({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(AppImages.appLogo),
      width: width,
    );
  }
}
