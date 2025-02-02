import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/features/attendance_statistics/view/statistics.dart';
import 'package:inlaks_attendance_app/features/authentication/provider/auth_provider.dart';
import 'package:inlaks_attendance_app/features/authentication/view/login.dart';
import 'package:inlaks_attendance_app/features/authentication/view/signup.dart';
import 'package:inlaks_attendance_app/features/check_in/view/check_in.dart';
import 'package:inlaks_attendance_app/features/check_in/view/manual_check_in.dart';
import 'package:inlaks_attendance_app/features/check_in/view/qr_scanner.dart';
import 'package:inlaks_attendance_app/features/dashboard/view/dashboard.dart';
import 'package:inlaks_attendance_app/features/profile/view/profile.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/models/task_model.dart';
import 'package:inlaks_attendance_app/features/task_planner/view/task_detail.dart';
import 'package:inlaks_attendance_app/features/task_planner/view/tasks_list.dart';
import 'package:inlaks_attendance_app/main_page.dart';
import 'package:provider/provider.dart';

part 'router.dart';
