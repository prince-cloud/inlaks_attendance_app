import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:inlaks_attendance_app/core/network/base_service.dart';
import 'package:inlaks_attendance_app/core/network/urls.dart';
import 'package:inlaks_attendance_app/features/authentication/provider/auth_provider.dart';
import 'package:inlaks_attendance_app/features/authentication/view/session_logic.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/models/task_comment_model.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/models/task_model.dart';

class TaskRepository {
  static getTasks() async {
    try {
      final response = await http.get(
        Uri.parse(URLS.getTaskUrl),
        headers: serviceHeaders,
      );

      if (response.statusCode == 401) {
        SessionLogic(AuthProvider()).handleTokenError(response.body);
      }

      final jsondata = json.decode(response.body);

      final data = jsondata['results'] as List;

      List<TaskModel> tasks = [];

      for (Map<String, dynamic> task in data) {
        tasks.add(TaskModel.fromJson(task));
      }

      return tasks;
    } on HttpException {
      throw 'Sorry something happened';
    }
  }

  static getTaskComment({required int taskId}) async {
    try {
      final response = await http.get(
        Uri.parse('${URLS.getTaskCommentUrl}?task=$taskId'),
        headers: serviceHeaders,
        
      );

      if(response.statusCode == 401) {
        SessionLogic(AuthProvider()).handleTokenError(response.body);
      }

      final jsondata = json.decode(response.body);

      final data = jsondata['results'] as List;

      List<TaskCommentModel> taskComments = [];

      for (Map<String, dynamic> comment in data) {
        taskComments.add(TaskCommentModel.fromJson(comment));
      }

      return taskComments;
    } on HttpException {
      throw 'Sorry something happened';
    }
  }
}
