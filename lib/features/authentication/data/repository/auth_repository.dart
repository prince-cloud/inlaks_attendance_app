import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:inlaks_attendance_app/core/network/urls.dart';

class AuthenticationRepository {
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    http.Response response;
    try {
      response = await http.post(
        Uri.parse(URLS.loginUrl),
        body: {'password': password, 'email': email},
      );
    } on HttpException {
      throw "Sorry something happened";
    }
    final data = json.decode(response.body) as Map<String, dynamic>;
    return data;
  }
}
