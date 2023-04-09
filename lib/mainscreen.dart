import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/leaderboard.dart';
import 'package:fit/main_challenges.dart';
import 'package:fit/models/user.dart';
import 'package:fit/profile.dart';
import 'package:fit/settings.dart';
import 'package:flutter/material.dart';
import 'globals.dart';

class MainScreenPage extends StatefulWidget {
  Client? user;

  MainScreenPage({Key? key, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  late final Client? user;

  int selectedIndex = 0;

  final fbInstance = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  late final screens = [
    MainChallengesPage(user: user!),
    ProfilePage(user: user),
    LeaderboardPage(),
    SettingsPage(),
  ];

  @override
  MainScreenPage get widget => super.widget;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.line_axis),
              label: 'Challenges',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]),
    ));
  }
}
