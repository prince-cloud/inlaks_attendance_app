

import 'package:inlaks_attendance_app/core/network/base_service.dart';

class URLS {
  //auth
  static String loginUrl = '$hostUrl/accounts/v1/login/';
  static String fetchQrCode = '$hostUrl/attendance/v1/qr-code/';
  static String markAttendance =
      '$hostUrl/attendance/v1/attendance/mark-attendance/';
  static String recentAttanceUrl =
      '$hostUrl/attendance/v1/attendance/get-recent-attendance/';
  static String getTaskUrl = '$hostUrl/attendance/v1/task-planner/';
  static String currentAttendanceUrl =
      '$hostUrl/attendance/v1/attendance/get-current-attendance/';
  static String manualClockInUrl =
      '$hostUrl/attendance/v1/attendance/manual-clock-out/';
  static String getTaskCommentUrl = '$hostUrl/attendance/v1/task-comment/';
  static String addTaskUrl = '$hostUrl/attendance/v1/task-comment/';
}
