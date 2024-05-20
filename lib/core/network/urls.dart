import 'package:inlaks_attendance_app/core/network/base_service.dart';

class URLS {
  //auth
  static String loginUrl = '$hostUrl/accounts/v1/login/';
  static String fetchQrCode = '$hostUrl/attendance/v1/qr-code/';
  static String markAttendance =
      '$hostUrl/attendance/v1/attendance/mark-attendance/';
}
