import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';
import 'package:inlaks_attendance_app/core/utils/provider_state.dart';
import 'package:inlaks_attendance_app/core/widgets/generic_button.dart';
import 'package:inlaks_attendance_app/features/check_in/view/manual_check_in.dart';
import 'package:inlaks_attendance_app/features/check_in/view/qr_scanner.dart';
import 'package:inlaks_attendance_app/features/dashboard/data/models/attenance_model.dart';
import 'package:inlaks_attendance_app/features/dashboard/providers/attendance_provider.dart';
import 'package:inlaks_attendance_app/features/dashboard/widgets/attendance_section.dart';
import 'package:inlaks_attendance_app/features/dashboard/widgets/clock_in_timer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  static const id = '/dashboard';
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => AttendanceProvider()
          ..getRecentAttendance()
          ..getCurrentAttendance(),
        child: Consumer<AttendanceProvider>(
            builder: (context, attedanceProvider, _) {
          AttendanceModel? currentAttendance =
              attedanceProvider.currentAttendance;
          return ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Hi, Prince',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.poppins,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            CupertinoIcons.bubble_right_fill,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: CustomColors.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: CustomColors.genericWhite,
                      ),
                      width: cs.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TODAY',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.poppins,
                              color: CustomColors.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (currentAttendance != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClockInTimerSection(
                                  clockInTime: currentAttendance.clockIn,
                                  clockOutTime: currentAttendance.clockOut,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Total Tracked Hours",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: CustomColors.genericBlack
                                        .withAlpha(100),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                if (currentAttendance.clockOut == null)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GenericButton(
                                        text: 'Clock Out',
                                        onPressed: () => showDialog(
                                          context: context,
                                          builder: (builder) => AlertDialog(
                                            title: const Text('Clock Out'),
                                            content: Text(
                                              'Are you sure you want to clock out at: ${DateFormat('hh:mm a - dd/MM/yyyy').format(DateTime.now())}',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.pushNamed(
                                                    context,
                                                    ManualCheckInScreen.id,
                                                    arguments:
                                                        currentAttendance.uuid,
                                                  );
                                                },
                                                child: const Text('Yes'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        backgroundColor:
                                            CustomColors.genericRed,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          if (attedanceProvider.state ==
                                  ProviderState.success &&
                              currentAttendance == null)
                            GenericButton(
                              text: 'Clock In',
                              onPressed: () => Navigator.pushNamed(
                                context,
                                QrScanner.id,
                                arguments: false,
                              ),
                              icon: const Icon(CupertinoIcons.qrcode),
                              backgroundColor: Colors.green,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const AttendanceSection()
            ],
          );
        }),
      ),
    );
  }
}
