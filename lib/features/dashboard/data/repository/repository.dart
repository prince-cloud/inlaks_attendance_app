import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:inlaks_attendance_app/core/network/base_service.dart';
import 'package:inlaks_attendance_app/core/network/urls.dart';
import 'package:inlaks_attendance_app/features/authentication/provider/auth_provider.dart';
import 'package:inlaks_attendance_app/features/authentication/view/session_logic.dart';

class AttendanceRepository {
  static Future<void> getRecentAttendance() async {
    http.Response response;
    try {
      response = await http.get(
        headers: serviceHeaders,
        Uri.parse(URLS.recentAttanceUrl),
      );
      if (response.statusCode == 401) {
        SessionLogic(AuthProvider()).handleTokenError(response.body);
        return;
      }
    } on HttpException {
      throw "Sorry something happened";
    }
    final data = json.decode(response.body);
    return data;
  }
}
