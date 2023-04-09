import 'dart:math';

import 'package:fit/ChallangeView.dart';
import 'package:fit/RandomChallange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'models/activity.dart';

class MainChallengesPage extends StatefulWidget {
  const MainChallengesPage({super.key});

  @override
  State<MainChallengesPage> createState() => _MainChallengesPageState();
}

class _MainChallengesPageState extends State<MainChallengesPage> {
  Progress progress = Progress([], []);

  var blue = Color(0xCC35b1b5);
  var green = Color(0xCC6BFE9F);
  var silver = Color(0x99737373F);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 100,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return GestureDetector(
                      onTap: () => _onStepTapped(index, context,
                          progress), // your function to handle step taps
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
                                          : index == progress.level - 1
                                              ? green
                                              : silver),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            if (index < progress.level - 1)
                              Text(progress.challanges[index].date.toString()),
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
                    shape: CircleBorder(),
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
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, color: green),
                        child: Icon(
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
  }
}

_onStepTapped(int index, var context, Progress progres) {
  if (index == progres.level - 1)
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const RandomChallangeView(),
          settings: RouteSettings(arguments: index)),
    );

  if (index < progres.level - 1)
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ChallangeView(),
          settings: RouteSettings(arguments: index)),
    );

  print(index);
  print(progres.level);
}
