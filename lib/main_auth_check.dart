import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inlaks_attendance_app/core/chache/local_cache.dart';
import 'package:inlaks_attendance_app/features/authentication/data/models.dart';
import 'package:inlaks_attendance_app/features/authentication/provider/auth_provider.dart';
import 'package:inlaks_attendance_app/features/authentication/view/login.dart';
// import 'package:inlaks_attendance_app/main_page.dart';
import 'package:provider/provider.dart';

class MainAuthCheck extends StatefulWidget {
  const MainAuthCheck({super.key});

  @override
  State<MainAuthCheck> createState() => _MainAuthCheckState();
}

class _MainAuthCheckState extends State<MainAuthCheck> {
  bool loggedInBefore = false;
  final secureStorage = const FlutterSecureStorage();

  void loginUserIn() async {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );
    final String dataStr = await LocalCache.getAuthData();

    if (dataStr.isEmpty) return;
    try {
      final Map data = jsonDecode(dataStr);
      authProvider.logIn(
        token: data['access_token'] as String,
        isLoggedIn: true,
        user: User.fromMap(data['user'] as Map<String, dynamic>),
      );
    } catch (e) {
      return;
    }

    final getLoggedInBefore = await secureStorage.read(
      key: "loggedInBefore",
    );
    if (getLoggedInBefore == true.toString()) {
      setState(() {
        loggedInBefore = true;
      });
    }
  }

  @override
  void initState() {
    loginUserIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider _ = Provider.of<AuthProvider>(
      context,
      listen: true,
    );
    return const LoginScreen();
    // return authProvider.isLoggedIn ? const MainPage() : const LoginScreen();
  }
}
