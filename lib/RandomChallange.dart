import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/UserImagePicker.dart';
import 'package:fit/UserImagePicker2.dart';
import 'package:fit/database.dart';

import 'models/activity.dart';
import 'package:fit/main_challenges.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';

class RandomChallangeView extends StatefulWidget {
  final Progress progress;
  final Function complete;

  const RandomChallangeView(
      {super.key, required this.progress, required this.complete});

  @override
  State<RandomChallangeView> createState() => _RandomChallangeViewState();
}

class _RandomChallangeViewState extends State<RandomChallangeView> {
  double _currentSliderValue = 1;
  @override
  Widget build(BuildContext context) {
    int? index = ModalRoute.of(context)!.settings.arguments as int?;
    Challange challange = Challange.generateChalange(widget.progress, index!);

    return Scaffold(
      backgroundColor: Colors.white,
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
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Your challange is:",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    challange.text.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                              child: Container(
                            height: 120,
                            child: UserImagePicker2(
                                challange_id:
                                    FirebaseAuth.instance.currentUser!.uid +
                                        "-" +
                                        index.toString()),
                          )),
                        ],
                      ),
                      const Text(
                        "Add your \nbeautifull picture!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter Intensity of Challange:",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xedFFFFFF),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              const BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 10,
                                  color: Color(0xedEEEEEE))
                            ]),
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: 4, left: 8, right: 6),
                          child: Slider(
                              value: _currentSliderValue,
                              max: 2,
                              divisions: 2,
                              label: Activity.intensityString(
                                  _currentSliderValue.round() + 1),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              }),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  /*
                  Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xedFFFFFF),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              const BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 10,
                                  color: Color(0xedEEEEEE))
                            ]),
                        child: const Padding(
                          padding:
                              EdgeInsets.only(bottom: 4, left: 8, right: 6),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.height,
                                size: 20,
                              ),
                              hintText: "Enter your height",
                              hintStyle: TextStyle(fontSize: 14),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              iconColor: Color(0xCC6BFE9F),
                            ),
                          ),
                        ),
                      )),*/
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {
                      ComplitedChallange c = ComplitedChallange(
                          activity: Activity.fromMap({
                            "type": challange.task,
                            "quantity": challange.quantity,
                            "intensity": _currentSliderValue.round() + 1,
                          }),
                          slika:
                              "https://firebasestorage.googleapis.com/v0/b/fitconnect-38ef3.appspot.com/o/user_image%20%2FprofileIcon.png?alt=media&token=3008631f-f6ac-4302-86c5-c510508a5eb6",
                          date: DateTime.now(),
                          challange: challange.text);
                      widget.complete(c);
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color.fromARGB(236, 255, 255, 255),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE))
                          ]),
                      child: const Text(
                        "Add Your Stats!",
                        style: TextStyle(
                            color: Color(0xff093923),
                            fontSize: 20,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color.fromARGB(236, 255, 255, 255),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE))
                          ]),
                      child: const Text(
                        "Go back!",
                        style: TextStyle(
                            color: Color(0xff093923),
                            fontSize: 20,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
