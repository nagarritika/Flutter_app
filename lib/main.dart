import 'package:flutter/material.dart';
import 'attendance_screen.dart';
import 'location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Tracking App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => AttendanceScreen(), // No 'const' here
        '/location': (context) =>
            const LocationScreen(), // 'const' is fine here for LocationScreen
      },
    );
  }
}
