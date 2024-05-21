// coverage:ignore-file
import 'dart:convert';

import 'package:inlaks_attendance_app/core/utils/type_defination.dart';
import 'package:inlaks_attendance_app/features/authentication/provider/auth_provider.dart';

class SessionLogic {
  const SessionLogic(this.authProvider);

  // final SessionState sessionState;
  final AuthProvider authProvider;

  bool handleTokenError(dynamic error) {
    final decodedError = jsonDecode(error.toString()) as DataMap;
    if (decodedError['code'] != null &&
        decodedError['code'] == 'token_not_valid') {
      authProvider.logOut();
      return true;
    }
    return false;
  }
}
