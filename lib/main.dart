import 'package:drawingui/SplashScreen.dart/splashscreen.dart';
import 'package:drawingui/draw/drawscreen.dart';
import 'package:drawingui/home/homescreen.dart';
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
      title: 'Drawing App',
      theme: ThemeData(
        
        
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        '/home': (context) => const Homescreen(),
        '/draw': (context) => const Drawscreen(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}

