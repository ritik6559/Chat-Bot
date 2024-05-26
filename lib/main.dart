import 'package:chatbot/screens/home_screen.dart';
import 'package:chatbot/utils/pallete.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Pallete.whiteColor)
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

