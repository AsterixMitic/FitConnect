import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'models/user.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

/*
final result = await FirebaseDatabase.instance
        .ref()
        .child('leaderboard')
        .orderByChild('score')
        .limitToLast(20)
        .once();

    final leaderboardScores = result.snapshot.children
        .map(
          (e) =&gt; LeaderboardModel.fromJson(e.value as Map, e.key == userId),
        )
        .toList();

    return leaderboardScores.reversed;*/ 

class _LeaderboardPageState extends State<LeaderboardPage> {
  
  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('users').orderBy('points', descending: true).limit(20).get(),
          builder: (context, snapshot) {
              if(snapshot.hasData){
                var ime = snapshot.data;

                List<QueryDocumentSnapshot> docs = snapshot.data!.docs;
                 List<Client> clients = docs.map((doc) => Client(
                    email: doc.get('email'),
                    name: doc.get('name'),
                    lastname: doc.get('lastname'),
                    points: doc.get('points'),
                    picture: doc.get('picture')
                 )).toList();

                print(clients[0].picture.toString());

                return ListView.separated(
                padding: const EdgeInsets.all(10),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    color: Colors.blueAccent,
                    child: Center(
                      child: Row(
                        children: [
                          CircleAvatar(
                          radius: 48, 
                          backgroundImage: NetworkImage(clients[index].picture.toString()),
                          backgroundColor: Colors.transparent,//NetworkImage('imageUrl'),
                          ),  
                          Text('${clients[index].name}'),

                        ],
                      )
                      ),
                  );
                }
                ,separatorBuilder: (BuildContext context, int index) => const Divider(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
          )
      )
    );
  }
}