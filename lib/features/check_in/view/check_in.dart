import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';
import 'package:inlaks_attendance_app/core/widgets/error_dialogue.dart';
import 'package:inlaks_attendance_app/core/widgets/generic_button.dart';
import 'package:inlaks_attendance_app/core/widgets/success_pop_up.dart';
import 'package:inlaks_attendance_app/features/authentication/provider/auth_provider.dart';
import 'package:inlaks_attendance_app/features/check_in/data/repository/repository.dart';
import 'package:inlaks_attendance_app/features/check_in/view/qr_scanner.dart';
import 'package:inlaks_attendance_app/features/dashboard/providers/attendance_provider.dart';
import 'package:inlaks_attendance_app/main_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckInScreen extends StatefulWidget {
  static const id = '/checking_screen';
  const CheckInScreen({super.key, required this.qrCode});

  final String qrCode;

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  clockStaffInOut({required String qrCode}) async {
    final response = await QrRepository.clockStaffInOut(qrCode: qrCode);
    if (response.statusCode == 200) {
      if (!mounted) return;
      Provider.of<AttendanceProvider>(context, listen: false)
          .getRecentAttendance();
      Navigator.pushReplacementNamed(context, MainPage.id);
      showSuccessPopUp(content: 'Clock In/Out Success', context: context);
      return;
    } else {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, QrScanner.id);
      showErrorPopUp('Something went wrong', context);
    }
  }

  @override
  void initState() {
    clockStaffInOut(qrCode: widget.qrCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    final cs = MediaQuery.of(context).size;
    final date = DateTime.now();
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  '${authProvider.user!.firstName} ${authProvider.user!.lastName}',
                  style: const TextStyle(
                    fontFamily: Fonts.poppins,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  authProvider.user!.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: cs.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomColors.genericWhite,
                  ),
                  child: Image.asset(
                    'assets/icons/loading2.gif',
                    height: cs.height * 0.3,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  DateFormat('MMM dd yyyy').format(date),
                  style: const TextStyle(
                    fontFamily: Fonts.poppins,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  DateFormat('h:m a').format(date),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: cs.width * 0.15,
                  ),
                  child: GenericButton(
                    text: 'Loading ...',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
