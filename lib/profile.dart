import 'package:fit/models/user.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  Client? user;
  ProfilePage({Key? key, this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {

  late Client? _user;

  @override
      void initState() {
        super.initState();
        _user = widget.user;
    }

  @override
  Widget build(BuildContext context) {

    var ime = _user!.name;
    var prezime = _user!.lastname;
    var visina = _user!.height;
    var tezina = _user!.weight;


    return Container(
      decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xCC6BFE9F),
            Color(0xCC35b1b5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
      child: Scaffold(
        

         body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text('Profile',
          style: TextStyle(fontSize: 30),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  CircleAvatar(
                radius: 48, 
                backgroundImage: AssetImage('images/profileIcon.png'),
                backgroundColor: Colors.transparent,//NetworkImage('imageUrl'),
              ),
              Text('$ime $prezime',
              style: TextStyle(fontSize: 30),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Visina: $visina  Tezina: $tezina',
              style: TextStyle(fontSize: 20),),
              ],
            )

          ]
        )
      )
    ));
  }
}