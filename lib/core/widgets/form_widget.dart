import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';

class GenericFormField extends StatefulWidget {
  const GenericFormField({
    super.key,
    this.prefixIcon,
    required this.controller,
    this.lableText,
    this.hintText,
    this.suffixIcon,
    this.enabled,
    this.onTap,
    this.obscure,
  });

  final Icon? prefixIcon;
  final TextEditingController controller;
  final String? lableText;
  final String? hintText;
  final Icon? suffixIcon;
  final bool? enabled;
  final bool? obscure;

  final void Function()? onTap;

  @override
  State<GenericFormField> createState() => _GenericFormFieldState();
}

class _GenericFormFieldState extends State<GenericFormField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: TextFormField(
          style: const TextStyle(
            fontFamily: Fonts.urbanist,
          ),
          controller: widget.controller,
          obscureText: widget.obscure ?? false,
          decoration: InputDecoration(
            enabled: widget.enabled ?? true,
            labelText: widget.lableText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
