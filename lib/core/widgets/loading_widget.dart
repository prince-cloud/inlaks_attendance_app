import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/widgets/spin_loader.dart';

void toggleIsLoading(
  BuildContext context,
  bool value,
) {
  value
      ? showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              const SpinningLoader(), //const LoadingAnimation(),
        )
      : Navigator.of(context).pop();
}
