import 'package:inlaks_attendance_app/core/network/base_service.dart';

class URLS {
  //auth
  static String loginUrl = '$hostUrl/accounts/v1/login/';
  static String getQrCodeUrl = '$hostUrl/attendance/v1/attendance/get-qr-code/';
  static String fetchQrCode = '$hostUrl/attendance/v1/attendance/';
}
