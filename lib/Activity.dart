import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Activity extends StatefulWidget {
  Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  var _bike = false;
  var _running = false;
  var _walking = false;
  var _swimming = false;

  @override
  Widget build(BuildContext context) {
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
                    "Select Activity!",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Biking!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  
                                  value: _bike,
                                  onChanged: (value) {
                                    setState(() {
                                      _bike = value!;
                                    });
                                  },
                                ),
                              ],
                            )),
                      )),
                  SizedBox(
                    height: 30,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Running!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  
                                  value: _running,
                                  onChanged: (value) {
                                    setState(() {
                                      _running = value!;
                                    });
                                  },
                                ),
                              ],
                            )),
                      )),
                      SizedBox(
                    height: 30,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Walking!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  
                                  value: _walking,
                                  onChanged: (value) {
                                    setState(() {
                                      _walking = value!;
                                    });
                                  },
                                ),
                              ],
                            )),
                      )),
                      SizedBox(
                    height: 30,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Swimming!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  
                                  value: _swimming,
                                  onChanged: (value) {
                                    setState(() {
                                      _swimming = value!;
                                    });
                                  },
                                ),
                              ],
                            )),
                      )),

                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.vibrate();
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
                        "Continue!",
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
