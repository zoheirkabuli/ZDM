import 'package:flutter/material.dart';
import 'package:zdm/presentation/screens/home/home.dart';
import 'package:zdm/core/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(color: AppColors.primary),
      ),
      home: const HomePage(),
    );
  }
}
