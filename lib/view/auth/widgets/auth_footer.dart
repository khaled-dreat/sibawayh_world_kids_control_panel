part of '../../../utils/import/app_import.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.first,
    required this.second,
    required this.onTap,
  });

  final String first, second;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: first.tr(),
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          const TextSpan(text: ' '),
          TextSpan(
            text: second.tr(),
            style: AppTheme.h6(context)
                ?.copyWith(color: AppTheme.colorAuth(context)),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
