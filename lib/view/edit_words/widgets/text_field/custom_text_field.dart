part of '../../../../utils/import/app_import.dart';

class CustomTextField extends StatefulWidget {
  final IconData? sufixicon;
  final String? hintText;
  final IconData? prefixIcon;
  final String? label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isPass;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  const CustomTextField(
      {super.key,
      this.sufixicon,
      this.hintText,
      this.prefixIcon,
      this.label,
      this.keyboardType,
      this.onSaved,
      this.isPass = false,
      this.validator,
      this.onChanged});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        obscureText: widget.isPass,
        obscuringCharacter: '✵',
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintTextDirection: TextDirection.rtl,
            suffixIcon: Icon(widget.sufixicon),
            prefix: Icon(widget.prefixIcon),
            labelText: widget.label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            )));
  }
}
