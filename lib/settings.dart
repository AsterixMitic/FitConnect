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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Center(
              child: Column(
            children: [
              ElevatedButton(
                  onPressed: logOut,
                  child: const Text(
                    "Log out",
                    style: TextStyle(fontSize: 50),
                  )),
            ],
          )),
        ],
      ),
    );
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
    //Navigator.pop()
  }
}
