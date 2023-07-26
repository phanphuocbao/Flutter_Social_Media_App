import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_clone/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social UI',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
