import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class CustomField extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;

  const CustomField({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.maxLength,
    required this.onChanged,
    this.obscure = false,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: const EdgeInsets.only(left: 34, right: 34),
      child: TextFormField(
        initialValue: widget.value,
        validator: widget.validator,
        maxLength: widget.maxLength,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          labelText: widget.label,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: textFieldTheme,
            ),
          ),
          prefixIcon: Icon(
            widget.suffixIcon ?? Icons.text_format,
            color: iconColor1,
          ),
          helperText: widget.hint,
          filled: true,
          fillColor: textFieldTheme,
          labelStyle: TextStyle(color: iconColor1),
        ),
        onChanged: (value) {
          widget.onChanged(value);
        },
      ),
    );
  }
}
