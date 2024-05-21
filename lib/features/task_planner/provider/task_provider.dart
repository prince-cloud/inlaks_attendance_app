

import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/provider_state.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/task_model.dart';
import 'package:inlaks_attendance_app/features/task_planner/repository/task_repo.dart';

class TaskProvider extends ChangeNotifier {
  ProviderState _state = ProviderState.loading;

  ProviderState get state => _state;

  void setState(ProviderState state) {
    _state = state;
    notifyListeners();
  }

  List<TaskModel> tasks = [];

 fetchTasks() async {
    setState(ProviderState.loading);
    try {
      final data = await TaskRepository.getTasks();

      tasks = data;

      print('=============$tasks');
     
    } catch (e) {
      print('=================$e');
      setState(ProviderState.error);
      notifyListeners();
    }
     setState(ProviderState.success);
    notifyListeners();
  }
}