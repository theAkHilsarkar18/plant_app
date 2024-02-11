import 'package:flutter/material.dart';
import 'package:plant_app/view/screens/cartscreen.dart';
import 'package:plant_app/view/screens/productscreen.dart';
import 'package:plant_app/view/screens/home/homescreen.dart';
import 'package:plant_app/view/screens/introscreen.dart';
import 'package:plant_app/view/screens/splashscreen.dart';

void main()
{
  runApp(PlantApp());
}

class PlantApp extends StatelessWidget {
  const PlantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      initialRoute: '/',
      routes: {
        '/' :(context) => SplashScreen(),
        '/cart' :(context) => CartScreen(),
        '/product' :(context) => ProductScreen(),
        '/home' :(context) => HomeScreen(),
        '/intro' :(context) => IntroScreen(),
      },
    );
  }
}

