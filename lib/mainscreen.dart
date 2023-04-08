import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/leaderboard.dart';
import 'package:fit/profile.dart';
import 'package:flutter/material.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});
  @override
  State<StatefulWidget> createState() => _MainScreenPageState();

}

class _MainScreenPageState extends State<MainScreenPage>{

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    final screens = [
      //MainScreenPage(),
      ProfilePage(),
      LeaderboardPage(),
    ];

    void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

    return SafeArea(
      child: Scaffold(
      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree),
              label: 'Leaderboard',
            ),
          ]

      )
      )
    );

  }

  Future logOut() async {
      await FirebaseAuth.instance.signOut();
  }

}
