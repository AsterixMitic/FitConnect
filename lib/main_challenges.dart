import 'dart:html';
import 'dart:math';
import 'package:fit/ChallangeViewDone.dart';
import 'package:fit/SplashScreen.dart';

import 'models/user.dart';
import 'package:fit/ChallangeView.dart';
import 'package:fit/RandomChallange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/activity.dart';

class MainChallengesPage extends StatefulWidget {
  final Client user;

  const MainChallengesPage({super.key, required this.user});

  @override
  State<MainChallengesPage> createState() => _MainChallengesPageState();
}

class _MainChallengesPageState extends State<MainChallengesPage> {
  Progress progress = Progress([], ['walk', 'run', 'cycle', 'swim']);

  var blue = Color(0xCC35b1b5);
  var green = Color(0xCC6BFE9F);
  var silver = Color(0x99737373F);

  void Complete(ComplitedChallange c) {
    setState(() {
      progress.addChallange(c);
      Database(uid: FirebaseAuth.instance.currentUser!.uid)
          .updateChallangeData(progress.challanges);
    });
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Database(uid: FirebaseAuth.instance.currentUser!.uid)
            .getChallangeData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Future.delayed(Duration.zero, () {
              setState(() {
                progress.challanges = snapshot.data!;
                progress.level = progress.challanges.length + 1;
              });
            });
            return Scaffold(
              body: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Text("Welcome back " + widget.user.name! + "!"),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 100,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            return GestureDetector(
                              onTap: () => _onStepTapped(
                                  index,
                                  context,
                                  progress,
                                  widget.user,
                                  Complete), // your function to handle step taps
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: index % 2 == 0 ? 100 : 0,
                                    right: index % 2 == 1 ? 100 : 0,
                                    bottom: 80),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Card(
                                        elevation: 10,
                                        shape: CircleBorder(),
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: index < progress.level - 1
                                                  ? blue
                                                  : (index ==
                                                          progress.level -
                                                              1) //&&
                                                      //!istiDan(
                                                      //  progress
                                                      //    .challanges
                                                      //  .last
                                                      //.date,
                                                      //    DateTime.now())
                                                      ? green
                                                      : silver),
                                          child: Center(
                                              child: Text(
                                            (index + 1).toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                            ),
                                          )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    if (index < progress.level - 1)
                                      Text(
                                        progress.challanges[index].date.day
                                                .toString() +
                                            "." +
                                            progress
                                                .challanges[index].date.month
                                                .toString() +
                                            " - " +
                                            dayInWeek(progress.challanges[index]
                                                .date.weekday),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          right: 20,
                          bottom: 20,
                          child: Card(
                            elevation: 10,
                            shape: const CircleBorder(),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ChallangeView(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: green),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SplashScreen();
          }
        });
  }
}

_onStepTapped(
    int index, var context, Progress progres, Client user, Function complete) {
  if (index == progres.level - 1)
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RandomChallangeView(
                progress: progres,
                complete: complete,
              ),
          settings: RouteSettings(arguments: index)),
    );

  if (index < progres.level - 1)
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChallangeViewDone(
              challange: progres.challanges[index], user: user),
          settings: RouteSettings(arguments: index)),
    );

  print(index);
  print(progres.level);
}

String dayInWeek(int n) {
  switch (n) {
    case 1:
      return "Monday";
    case 2:
      return "Thursday";
    case 3:
      return "Wednesday";
    case 4:
      return "Tuesday";
    case 5:
      return "Friday";
    case 6:
      return "Saturday";
    case 7:
      return "Sunday";
    default:
      return "Monday";
  }
}

bool istiDan(DateTime a, DateTime b) {
  return a.day == b.day && a.month == b.month && a.year == b.year;
}
