import 'package:flutter/material.dart';
import 'attendance_screen.dart';
import 'location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Tracking App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => AttendanceScreen(),
        '/location': (context) => LocationScreen(),
      },
    );
  }
}
