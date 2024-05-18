import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';

class GenericButton extends StatelessWidget {
  final Color? backgroundColor;
  final String text;
  final void Function() onPressed;
  const GenericButton({
    super.key,
    this.cs,
    this.backgroundColor,
    required this.text,
    required this.onPressed,
  });

  final Size? cs;

  @override
  Widget build(BuildContext context) {
    final css = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
          // vertical: 10.0,
          // horizontal: 10.0,
          ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(css.width, 52),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: backgroundColor ?? CustomColors.primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: Fonts.urbanist,
          ),
        ),
      ),
    );
  }
}
