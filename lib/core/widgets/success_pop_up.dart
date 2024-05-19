import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';
import 'package:inlaks_attendance_app/core/widgets/custom_sizes.dart';

showSuccessPopUp({
  required String content,
  required BuildContext context,
  FlushbarPosition? position,
}) {
  return Flushbar(
    messageText: Row(
      children: [
        Container(
          width: Sizes.width(context, 0.2),
          height: Sizes.height(context, 0.08),
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.check_circle,
              color: CustomColors.genericWhite,
              size: Sizes.height(context, 0.04),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: Sizes.height(context, 0.08),
            decoration: BoxDecoration(
              color: CustomColors.genericWhite,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                const Text(
                  'Success',
                  style: TextStyle(
                    fontFamily: Fonts.urbanist,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                Flexible(
                  child: Text(
                    content,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    flushbarPosition: position ?? FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.FLOATING,
    backgroundColor: Colors.transparent,
    duration: const Duration(seconds: 4),
  )..show(context);
}
