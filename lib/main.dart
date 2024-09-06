import 'package:chatbot/screens/home_screen.dart';
import 'package:chatbot/utils/pallete.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
        
      ),
      debugShowCheckedModeBanner: false,
      home: const Text("AIzaSyCRG1AX9DUx0zhVbmQZGxkoGM9LMfbo01M"),
    );
  }
}

