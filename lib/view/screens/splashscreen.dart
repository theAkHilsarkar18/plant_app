import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () {

      Navigator.pushReplacementNamed(context, '/intro');

    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset('asset/img/l1.png'),
        ),
      ),
    );
  }
}
