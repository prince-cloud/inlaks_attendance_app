import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static const id = '/dashboard';
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withAlpha(10),
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
