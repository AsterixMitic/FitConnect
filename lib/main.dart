import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/ChallangeViewDone.dart';
import 'package:fit/Notifications_service.dart';
import 'package:fit/SplashScreen.dart';
import 'package:fit/database.dart';
import 'package:fit/main_challenges.dart';
import 'package:fit/mainscreen.dart';
import 'package:fit/models/user.dart';
import 'package:fit/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth.dart';
import 'firebase_options.dart';
import 'AditionalInfo.dart';

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

Client? u;

class _MainAppState extends State<MainApp> {

  late bool isNotifications;

  @override
  void initState() {
    super.initState();
    checkNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FitConnect',
      debugShowCheckedModeBanner: false,
       home: MyHomePage(),
      );
  }
  
  void checkNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    isNotifications = prefs.getBool('notifications') ?? true;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  NotificationsServices notificationsServices = NotificationsServices();

  @override
  void initState() {
    super.initState();
    notificationsServices.initialiseNotifications();
    notificationsServices.scheduleNotification("Uradi izazov", "Tvoj danasnji izazov je spreman i ceka na tebe!");
  }

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
          
        builder:  (context, snapshot){
          if(snapshot.hasData){
            return FutureBuilder<Client?>(
              future: Database(uid: snapshot.data!.uid).getUserData(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  if(snapshot.data!.name==null){
                    return AditionalInfo(user: snapshot.data);
                  } else{
                    return MainScreenPage(user: snapshot.data);
                  }
                } else if(snapshot.hasError){
                    return Text(snapshot.error.toString());
                }
                else{
                    return CircularProgressIndicator();
                }
              }
              );
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

