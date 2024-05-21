import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/provider_state.dart';
import 'package:inlaks_attendance_app/features/dashboard/data/models/attenance_model.dart';
import 'package:inlaks_attendance_app/features/dashboard/data/repository/repository.dart';

class AttendanceProvider extends ChangeNotifier {
  ProviderState _state = ProviderState.loading;
  ProviderState get state => _state;
  setState(ProviderState state) {
    _state = state;
    notifyListeners();
  }

  List<AttendanceModel> attandances = [];

  AttendanceModel? currentAttendance;

  getRecentAttendance() async {
    try {
      final response = await AttendanceRepository.getRecentAttendance();
      attandances =
          (response as List).map((e) => AttendanceModel.fromJson(e)).toList();
    } catch (e) {
      setState(ProviderState.error);
      notifyListeners();
      return;
    }
    setState(ProviderState.success);
    notifyListeners();
  }

  getCurrentAttendance() async {
    try {
      final response = await AttendanceRepository.getCurrentAttendance();
      if (response['user'] != null) {
        currentAttendance = AttendanceModel.fromJson(response);
      }
    } catch (e) {
      setState(ProviderState.error);
      notifyListeners();
      return;
    }
    setState(ProviderState.success);
    notifyListeners();
  }
}
