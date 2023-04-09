
import 'package:fit/UserImagePicker.dart';
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
    var userImage = _user!.picture;
    do {
      ime = _user?.name;
      prezime = _user?.lastname;
      visina = _user!.height;
      tezina = _user!.weight;
      userImage = _user!.picture;

      
    
    } while(_user!.name==null);
    


    return Scaffold(
       body: Container(
      decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xCC6BFE9F),
            Color(0xCC35b1b5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
      child: Column(
        children: [
          SizedBox(height: 30),
          const Text(
                    "Your Profile!",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                 Container(
                              height: 120,
                              child:CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(userImage.toString()) ,
                              ),
                            ),
              waitToLoad(ime, prezime),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              waitToLoadWeight(visina, tezina),
            ],
          )

        ]
      )
    )
    );
  }

  Text waitToLoadWeight(int visina, int tezina) {
    return Text('Visina: $visina  Tezina: $tezina',
          style: TextStyle(fontSize: 20),);
  }

  Text waitToLoad(String? ime, String? prezime) {
    return Text('$ime $prezime',
          style: TextStyle(fontSize: 30),);
  }
}