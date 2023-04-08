import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainChallengesPage extends StatefulWidget {
  const MainChallengesPage({super.key});

  @override
  State<MainChallengesPage> createState() => _MainChallengesPageState();
}

class _MainChallengesPageState extends State<MainChallengesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       body: Center(
        child: Text('This is challanges',
        style: TextStyle(fontSize: 30),),
      )
    );
  }
}