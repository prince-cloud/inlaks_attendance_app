import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:inlaks_attendance_app/core/network/base_service.dart';
import 'package:inlaks_attendance_app/core/network/urls.dart';

class QrRepository {
  static Future<int> checkQrValidaity({
    required String qrCode,
  }) async {
    try {
      http.Response response = await http.get(
        headers: serviceHeaders,
        Uri.parse('${URLS.fetchQrCode}$qrCode/'),
      );
      if (response.statusCode == 200) {
        return 200;
      }
      return 404;
    } on HttpException {
      throw "Sorry something happened";
    }
  }

  static clockStaffInOut({
    required String qrCode,
  }) async {
    try {
      http.Response response = await http.get(
        headers: serviceHeaders,
        Uri.parse('${URLS.markAttendance}?qr_code=$qrCode'),
      );
      return response;
    } on HttpException {
      throw "Sorry something happened";
    }
  }

  static manualClockOut() async {
    try {
      http.Response response = await http.get(
        headers: serviceHeaders,
        Uri.parse(URLS.manualClockInUrl),
      );
      return response;
    } on HttpException {
      throw "Sorry something happened";
    }
  }
}
