import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/services/router.imports.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';
import 'package:inlaks_attendance_app/features/authentication/provider/auth_provider.dart';
import 'package:inlaks_attendance_app/features/dashboard/providers/attendance_provider.dart';
import 'package:inlaks_attendance_app/main_auth_check.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<AttendanceProvider>(
          create: (context) => AttendanceProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inlaks Attendance App',
        theme: ThemeData(
          fontFamily: Fonts.urbanist,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const MainAuthCheck(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
