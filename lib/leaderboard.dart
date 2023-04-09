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

class _LeaderboardPageState extends State<LeaderboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
                    "Leaderboard, be the best!",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),

            Expanded(
              child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('users').orderBy('points', descending: true).limit(20).get(),
                builder: (context, snapshot) {
                    if(snapshot.hasData){
                      
            
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
                      itemCount: clients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 100,
                            color: index==0? Colors.amber: index==1? Colors.grey: index==2? Color.fromARGB(255, 152, 109, 93):Color.fromARGB(204, 23, 77, 79),
                            child: Padding(
            
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                  radius: 48, 
                                  backgroundImage: NetworkImage(clients[index].picture.toString()),
                                  backgroundColor: Colors.transparent,//NetworkImage('imageUrl'),
                                  ),  
                                  Text('${clients[index].name}'),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text('${clients[index].points}'),
                                  ),
                                              
                                ],
                              ),
                            ),
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
                ),
            ),
          ],
        )
      )
    );
  }
}