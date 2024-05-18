// coverage:ignore-file
import 'package:flutter/foundation.dart';

class SessionState extends ChangeNotifier {
  factory SessionState() {
    if (_instance._isDisposed) {
      return SessionState._internal();
    } else {
      return _instance;
    }
  }

  SessionState._internal();

  bool _isDisposed = false;

  bool _isLoggedIn = false;

  static final SessionState _instance = SessionState._internal();

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    debugPrint('Session expired');
    _isLoggedIn = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
