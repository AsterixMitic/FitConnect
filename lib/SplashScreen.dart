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
            height: 200,
            width: 200,
            child: RiveAnimation.asset("assets/fit.riv",artboard: "Loading",),),
        ),
        
        
      
    );
  }
}