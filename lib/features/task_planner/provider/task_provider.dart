

import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/provider_state.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/models/task_comment_model.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/models/task_model.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/repository/task_repo.dart';

class TaskProvider extends ChangeNotifier {
  ProviderState _state = ProviderState.loading;

  ProviderState get state => _state;

  void setState(ProviderState state) {
    _state = state;
    notifyListeners();
  }

  List<TaskModel> tasks = [];
  List<TaskModel> completedTask = [];
  List<TaskModel> uncompletedTask = [];

 fetchTasks() async {
    setState(ProviderState.loading);
    try {
      final data = await TaskRepository.getTasks();

      tasks = data;
      completedTask = tasks.where((task)=>task.status.toUpperCase() != 'NOT COMPLETED').toList();
      uncompletedTask = tasks.where((task)=>task.status.toUpperCase() == 'NOT COMPLETED').toList();

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


class TaskCommentProvider extends ChangeNotifier {
  ProviderState _state = ProviderState.loading; 

  ProviderState get state => _state;

  void setState(ProviderState state) {
    _state = state;
    notifyListeners();
  }

  List<TaskCommentModel> taskComments = [];
  fetchComments({required int taskId}) async {
    setState(ProviderState.loading);
    try {
      final data = await TaskRepository.getTaskComment(taskId: taskId);
      taskComments = data;

    } catch (e) {
      setState(ProviderState.error);
      notifyListeners();
    }
    setState(ProviderState.success);
    notifyListeners();
  }

}