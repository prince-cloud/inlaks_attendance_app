

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';

AppBar customAppBar({required BuildContext context,String? title, Icon? widget}) {
 return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CustomColors.genericBlack.withAlpha(80),
          ),
          child: const Icon(
            CupertinoIcons.back,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child:  widget ?? Icon(
            CupertinoIcons.app_badge,
            color: CustomColors.genericBlack,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
      title: Text(
        title ??'Task Detail',
        style: TextStyle(
          color: CustomColors.primaryTextLight,
          fontSize: 15,
        ),
      ),
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
    );
}
