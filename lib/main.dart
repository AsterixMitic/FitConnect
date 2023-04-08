import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/SplashScreen.dart';
import 'package:fit/mainscreen.dart';
import 'package:fit/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';
import 'firebase_options.dart';

var _showSplash =true;

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
  );
  runApp( const MainApp());
}


final navigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}


class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FitConnect',
      debugShowCheckedModeBanner: false,
       home: MyHomePage(),
      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Fb firebase = Fb();
    
    if(_showSplash){
      Timer(const Duration(seconds: 2),(){
        setState(() {
          _showSplash =false;
        });
        });
      return SplashScreen();
    }else {
      return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
          
        builder: (context, snapshot){
          if(snapshot.hasData){
               return const MainScreenPage();
          }
          else{
            return AuthPage();
          }
        }
      ,)
    );
    }
    
  }
}

