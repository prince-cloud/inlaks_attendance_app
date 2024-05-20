import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';

class ClockInTimerSection extends StatefulWidget {
  const ClockInTimerSection({
    super.key,
    required this.clockInTime,
    this.clockOutTime,
  });
  final String clockInTime;
  final String? clockOutTime;

  @override
  State<ClockInTimerSection> createState() => _ClockInTimerSectionState();
}

class _ClockInTimerSectionState extends State<ClockInTimerSection> {
  late DateTime clockInTime;
  late Timer timer;
  int? hours;
  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    super.initState();

    clockInTime = DateTime.parse(widget.clockInTime);

    if (widget.clockOutTime != null) {
      DateTime clockInTime = DateTime.parse(widget.clockInTime);
      DateTime clockOutTime = DateTime.parse(widget.clockOutTime!);
      Duration difference = clockOutTime.difference(clockInTime);
      setState(() {
        hours = difference.inHours;
        minutes = difference.inMinutes.remainder(60);
        seconds = difference.inSeconds.remainder(60);
      });
    } else {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer t) => _updateTime(),
      );
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    Duration difference = DateTime.now().difference(clockInTime);
    setState(() {
      hours = difference.inHours;
      minutes = difference.inMinutes.remainder(60);
      seconds = difference.inSeconds.remainder(60);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        hours != null
            ? Text(
                '$hours : $minutes : $seconds',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.urbanist,
                ),
              )
            : const SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(),
              ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CustomColors.primaryColor.withAlpha(20),
          ),
          child: const Icon(CupertinoIcons.time),
        ),
      ],
    );
  }
}
