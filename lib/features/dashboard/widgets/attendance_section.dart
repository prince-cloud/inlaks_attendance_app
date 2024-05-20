import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';
import 'package:inlaks_attendance_app/features/dashboard/providers/attendance_provider.dart';
import 'package:inlaks_attendance_app/features/dashboard/widgets/recent_attendance.dart';
import 'package:provider/provider.dart';

class AttendanceSection extends StatefulWidget {
  const AttendanceSection({super.key});

  @override
  State<AttendanceSection> createState() => _AttendanceSectionState();
}

class _AttendanceSectionState extends State<AttendanceSection> {
  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => AttendanceProvider()..getRecentAttendance(),
      child: Consumer<AttendanceProvider>(
        builder: (context, attedanceProvider, _) => Column(
          children: [
            const Center(
              child: Column(
                children: [
                  Text(
                    'My Attendance',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.poppins,
                    ),
                  ),
                  Text(
                    'Last 7 days',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: CustomColors.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: cs.width * 0.2,
                    child: Center(
                      child: Text(
                        'Date',
                        style: TextStyle(
                          color: CustomColors.genericWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: cs.width * 0.2,
                    child: Center(
                      child: Text(
                        'Clock In',
                        style: TextStyle(
                          color: CustomColors.genericWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: cs.width * 0.2,
                    child: Center(
                      child: Text(
                        'Clock Out',
                        style: TextStyle(
                          color: CustomColors.genericWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: cs.width * 0.2,
                    child: Center(
                      child: Text(
                        'Hrs',
                        style: TextStyle(
                          color: CustomColors.genericWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: attedanceProvider.attandances.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final attendance = attedanceProvider.attandances[index];
                return RecentAttedance(
                  attendance: attendance,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
