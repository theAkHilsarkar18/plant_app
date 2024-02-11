import 'dart:async';

import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () {

      Navigator.pushReplacementNamed(context, '/home');

    });

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset('asset/img/bg.png'),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 250,
                width: 400,
                padding: const EdgeInsets.all(30),
                // color: Colors.black12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome to',style: TextStyle(
                        color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30
                    ),),
                    Text('Potea',style: TextStyle(
                        color: Colors.green,fontWeight: FontWeight.bold,fontSize: 45
                    ),),

                    Text('The best plant for ecommere app online,The best plant for ecommere app online',style: TextStyle(
                        color: Colors.black,fontSize: 12
                    ),),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
