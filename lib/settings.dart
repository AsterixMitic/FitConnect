import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'globals.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool isNotifications;
  late final prefs;

  @override
  void initState() {
    super.initState();
  }

  void changeState(val) async {
    //isNotifications = prefs.getBool('notifications') ?? true;
    prefs.setBool('notifications', val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: logOut,
              child: Text(
                "Log out",
                style: TextStyle(fontSize: 50),
              )),
          Column(
            children: [
              Text("Notifications"),
            ],
          ),
        ],
      )),
    );
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
    //Navigator.pop()
  }
}
