import 'package:flutter/material.dart';
import 'package:flutter_task/number_grid_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple.shade200,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple.shade100,
          primary: Colors.purple.shade600,
          secondary: Colors.purple.shade50,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: const NumberGridPage(),
    );
  }
}
