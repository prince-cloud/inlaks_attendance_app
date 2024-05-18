import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';

Text headingText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 20,
      fontFamily: Fonts.urbanist,
      fontWeight: FontWeight.bold,
    ),
  );
}
