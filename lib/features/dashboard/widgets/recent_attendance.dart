import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';
import 'package:inlaks_attendance_app/features/dashboard/data/models/attenance_model.dart';
import 'package:intl/intl.dart';

class RecentAttedance extends StatelessWidget {
  final AttendanceModel attendance;
  const RecentAttedance({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    final day = DateFormat('dd').format(DateTime.parse(attendance.dateCreated));
    final dayName =
        DateFormat('EEE').format(DateTime.parse(attendance.dateCreated));
    final clockIn =
        DateFormat('hh:mm a').format(DateTime.parse(attendance.clockIn));
    final clockOut = attendance.clockOut != null
        ? DateFormat('hh:mm a').format(DateTime.parse(attendance.clockOut!))
        : '-';

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: cs.width * 0.2,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomColors.primaryColor.withAlpha(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        day,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.poppins,
                        ),
                      ),
                      Text(
                        dayName,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: cs.width * 0.2,
              child: Center(
                child: Text(
                  clockIn,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: cs.width * 0.2,
              child: Center(
                child: Text(
                  clockOut,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: cs.width * 0.2,
              child: Center(
                child: Text(
                  attendance.hourseWorked != null
                      ? attendance.hourseWorked!.toString()
                      : '-',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
