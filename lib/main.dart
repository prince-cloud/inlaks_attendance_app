import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/services/router.imports.dart';
import 'package:inlaks_attendance_app/core/utils/fonts.dart';
import 'package:inlaks_attendance_app/features/authentication/view/login.dart';
import 'package:inlaks_attendance_app/features/authentication/view/session_state.dart';
import 'package:inlaks_attendance_app/features/authentication/view/signup.dart';
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
        ChangeNotifierProvider(create: (_) => SessionState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: Fonts.urbanist,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const LoginScreen(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
