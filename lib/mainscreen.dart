import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});
  @override
  State<StatefulWidget> createState() => _MainScreenPageState();

}

class _MainScreenPageState extends State<MainScreenPage>{
  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Signed in as:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              user!.email!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text("Ovo testiram main screen"),
            ElevatedButton(
              onPressed: logOut,
              child: Text('Log out'),
            ),

          ],
        )
      ),
    );
  }

  Future logOut() async {
      await FirebaseAuth.instance.signOut();
  }

}
