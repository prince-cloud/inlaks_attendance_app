import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';
import 'package:inlaks_attendance_app/core/widgets/generic_button.dart';
import 'package:inlaks_attendance_app/features/check_in/view/qr_scanner.dart';
import 'package:inlaks_attendance_app/features/dashboard/providers/attendance_provider.dart';
import 'package:inlaks_attendance_app/features/dashboard/widgets/recent_attendance.dart';
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
        create: (context) => AttendanceProvider()..getRecentAttendance(),
        child: Consumer<AttendanceProvider>(
          builder: (context, attedanceProvider, _) => ListView(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '05 : 20 : 21',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Fonts.urbanist,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      CustomColors.primaryColor.withAlpha(20),
                                ),
                                child: const Icon(CupertinoIcons.time),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Total Tracked Hours",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: CustomColors.genericBlack.withAlpha(100),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GenericButton(
                            text: 'Clock Out',
                            onPressed: () => Navigator.pushNamed(
                              context,
                              QrScanner.id,
                            ),
                            icon: const Icon(CupertinoIcons.qrcode),
                            backgroundColor: CustomColors.genericRed,
                          ),
                          const SizedBox(
                            height: 20,
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
      ),
    );
  }
}
