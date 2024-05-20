import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inlaks_attendance_app/core/chache/local_cache.dart';
import 'package:inlaks_attendance_app/core/network/base_service.dart';
import 'package:inlaks_attendance_app/features/authentication/data/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  String? token;
  bool isLoggedIn = false;
  User? user;

  final secureStorage = const FlutterSecureStorage();

  logIn({required token, required isLoggedIn, required user}) {
    this.token = token;
    this.isLoggedIn = isLoggedIn;
    this.user = user;
    serviceHeaders['Authorization'] = "Bearer ${this.token}";
    notifyListeners();
  }

  logOut() {
    serviceHeaders['Authorization'] = "";
    user = null;
    isLoggedIn = false;
    LocalCache.clearData();

    notifyListeners();
  }

  // whoamI() async {
  //   user = await AuthService().whoamI();
  //   notifyListeners();
  // }
}
