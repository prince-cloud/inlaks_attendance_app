import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/features/attendance_statistics/view/statistics.dart';
import 'package:inlaks_attendance_app/features/authentication/provider/auth_provider.dart';
import 'package:inlaks_attendance_app/features/check_in/view/qr_scanner.dart';
import 'package:inlaks_attendance_app/features/dashboard/view/dashboard.dart';
import 'package:inlaks_attendance_app/features/profile/view/profile.dart';
import 'package:inlaks_attendance_app/features/task_planner/view/tasks_list.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static const id = '/main_page';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  List pages = const [
    Dashboard(),
    AttendanceStatistics(),
    TaskList(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  bool appInForeground = true;
  bool isPasscodeTrue = false;

  final secureStorage = const FlutterSecureStorage();
  // final LocalAuthentication auth = LocalAuthentication();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    AuthProvider authProvider = context.read<AuthProvider>();
    if (state == AppLifecycleState.resumed) {
      setState(() {
        //authProvider.logOut();
        appInForeground = true;
      });
    }
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      setState(() {
        appInForeground = false;
      });
      Future.delayed(
        const Duration(minutes: 2),
        () async {
          if (appInForeground == false) {
            setState(
              () {
                authProvider.logOut();
              },
            );
          }
        },
      );
    }
  }

  double iconSize = 30;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      floatingActionButton: currentIndex == 2
          ? GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                radius: 35,
                child: Icon(
                  size: 30,
                  CupertinoIcons.plus,
                ),
              ),
            )
          : GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                QrScanner.id,
              ),
              child: const CircleAvatar(
                radius: 35,
                child: Icon(
                  size: 40,
                  CupertinoIcons.qrcode_viewfinder,
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          CupertinoIcons.rectangle_grid_2x2_fill,
          CupertinoIcons.calendar,
          CupertinoIcons.square_stack_3d_up,
          CupertinoIcons.profile_circled,
        ],
        backgroundColor: CustomColors.scaffoldBackgroundColor,
        splashRadius: 0,
        splashColor: Colors.transparent,
        activeIndex: currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => currentIndex = index),
        activeColor: CustomColors.primaryColor,
        inactiveColor: CustomColors.genericBlack.withAlpha(100),
        //other params
      ),
    );
  }
}
