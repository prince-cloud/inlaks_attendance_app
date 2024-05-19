import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';
import 'package:inlaks_attendance_app/core/widgets/custom_sizes.dart';

showErrorPopUp(String content, BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.5,
    child: Flushbar(
      messageText: Row(
        children: [
          Container(
            width: Sizes.width(context, 0.2),
            height: Sizes.height(context, 0.08),
            decoration: BoxDecoration(
              color: CustomColors.genericRed,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.cancel_outlined,
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
                    'Error',
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
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 4),
    )..show(context),
  );
}
