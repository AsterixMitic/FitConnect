import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/leaderboard.dart';
import 'package:fit/main_challenges.dart';
import 'package:fit/profile.dart';
import 'package:fit/settings.dart';
import 'package:flutter/material.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});
  @override
  State<StatefulWidget> createState() => _MainScreenPageState();

}

class _MainScreenPageState extends State<MainScreenPage>{

  int selectedIndex = 0;

  final user = FirebaseAuth.instance.currentUser;

    final screens = [
      MainChallengesPage(),
      ProfilePage(),
      LeaderboardPage(),
      SettingsPage(),
    ];

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
          ]
      ),

    )
    );

  }



}
