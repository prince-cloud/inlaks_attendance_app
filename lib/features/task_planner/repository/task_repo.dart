import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:inlaks_attendance_app/core/network/base_service.dart';
import 'package:inlaks_attendance_app/core/network/urls.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/task_model.dart';

class TaskRepository {
  static getTasks() async {
    try {
      final response = await http.get(
        Uri.parse(URLS.getTaskUrl),
        headers: serviceHeaders,
      );


      print('========${response.body}========');
    final jsondata = json.decode(response.body) ;

    final data = jsondata['results'] as List;

    List<TaskModel> tasks = [];

    for(Map<String, dynamic> task in data) {
      tasks.add(TaskModel.fromJson(task));
    }

    
    return tasks;
    } on HttpException {
      throw 'Sorry something happened';
    }
  }


}
