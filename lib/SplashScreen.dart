import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xff6BFE9F),  
        body: Center(
          child: Container(
            height: 20,
            width: 20,
            child: RiveAnimation.asset("fit.riv",artboard: "New Artboard",)),
        ),
        
        
      
    );
  }
}