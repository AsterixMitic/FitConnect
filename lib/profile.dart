import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit/UserImagePicker.dart';
import 'package:fit/models/user.dart';
import 'package:flutter/material.dart';
import 'Notifications_service.dart';

class ProfilePage extends StatefulWidget {
  Client? user;
  ProfilePage({Key? key, this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Client? _user;

  NotificationsServices notificationsServices = NotificationsServices();

  @override

      void initState() {
        super.initState();
        notificationsServices.initialiseNotifications();
      notificationsServices.sendNotification("Uradi izazov", "Tvoj danasnji izazov je spreman i ceka na tebe!");
        _user = widget.user;
    }

  @override
  Widget build(BuildContext context) {
    var ime = _user!.name;
    var prezime = _user!.lastname;
    var visina = _user!.height;
    var tezina = _user!.weight;
    var userImage = _user!.picture;
    Timer(Duration(seconds: 3), () {
      setState(() {});
    });

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
            child: Column(children: [
              SizedBox(height: 30),
              const Text(
                "Your Profile!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 120,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(userImage.toString()),
                    ),
                  ),
                  waitToLoad(ime, prezime),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  waitToLoadWeight(visina, tezina),
                ],
              ),
              SizedBox(height: 30,),
              Expanded(
                child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .orderBy('points', descending: false)
                      .limit(10)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<QueryDocumentSnapshot> docs = snapshot.data!.docs;
                      List<Client> clients = docs
                          .map((doc) => Client(
                              email: doc.get('email'),
                              name: doc.get('name'),
                              lastname: doc.get('lastname'),
                              points: doc.get('points'),
                              picture: doc.get('picture')))
                          .toList();

                      return ListView.separated(
                        padding: const EdgeInsets.all(10),
                        itemCount: clients.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 300,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                          width: 300,
                                          child: Image(
                                            image: NetworkImage(
                                              clients[index].picture.toString(),
                                            ),
                                          )),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: const Text(
                                        "Neki tekst!",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              )
            ])));
  }

  Text waitToLoadWeight(int visina, int tezina) {
    return Text(
      'Visina: $visina  Tezina: $tezina',
      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
    );
  }

  Text waitToLoad(String? ime, String? prezime) {
    return Text(
      '$ime $prezime',
      style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
    );
  }
}
