import 'package:flutter/material.dart';
import 'ui/screens/login_screen.dart';
import 'ui/theme/app_theme.dart';

void main() {
  runApp(const WaikiriaApp());
}

class WaikiriaApp extends StatelessWidget {
  const WaikiriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waikiria',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}