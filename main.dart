import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CodeForgeFlutterApp());
}

class CodeForgeFlutterApp extends StatelessWidget {
  const CodeForgeFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF29C7FF),
      brightness: Brightness.dark,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CodeForge Flutter',
      theme: ThemeData(colorScheme: scheme, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
