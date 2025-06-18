import 'package:drawingui/SplashScreen.dart/splashscreen.dart';
import 'package:drawingui/draw/drawscreen.dart';
import 'package:drawingui/draw/model/offset.dart';
import 'package:drawingui/draw/model/stroke.dart';
import 'package:drawingui/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();


Hive.registerAdapter(OffsetcustomAdapter());
Hive.registerAdapter(StrokeAdapter());
  await Hive.openBox<List<Stroke>>('drawing');
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

