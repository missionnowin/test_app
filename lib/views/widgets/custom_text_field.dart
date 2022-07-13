import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    Key? key,
    required this.name,
    required this.label,
    this.action,
    this.initialValue,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.hintText,
    this.borderColor,
    this.isMultiline = false,
  }) : super(key: key);

  final TextInputAction? action;
  final String name;
  final String label;
  final String? initialValue;
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color? borderColor;
  final bool isMultiline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            color: const Color(0xFF1D293F).withOpacity(0.5),
            fontWeight: FontWeight.w400,
            decorationStyle: TextDecorationStyle.dashed,
          ),
        ),
        const SizedBox(height: 6),
        FormBuilderTextField(
          textInputAction: action,
          name: name,
          initialValue: initialValue,
          keyboardType: TextInputType.text,
          validator: validator,
          minLines: isMultiline ? 20 : 1,
          maxLines: isMultiline ? 20 : 1,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Color(0xFF009ED1), width: 0.5),
            ),
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
