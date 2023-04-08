import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AditionalInfo extends StatelessWidget {
  const AditionalInfo({super.key});

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
                    "Enter additional info!",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20,),
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
                              child: Image.asset("images/profileIcon.png"),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2,
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
                                        Icons.person,
                                        size: 20,
                                      ),
                                      hintText: "Enter your name",
                                      hintStyle: TextStyle(fontSize: 13),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      iconColor: Color(0xCC6BFE9F),
                                    ),
                                  ),
                                ),
                              )),
                              SizedBox(height: 10,),
                              Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2,
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
                                        Icons.person,
                                        size: 20,
                                      ),
                                      hintText: "Enter your surname",
                                      hintStyle: TextStyle(fontSize: 13),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      iconColor: Color(0xCC6BFE9F),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter Required Data!",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
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
                        child: const Padding(
                          padding:
                              EdgeInsets.only(bottom: 4, left: 8, right: 6),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.monitor_weight_rounded,
                                size: 20,
                              ),
                              hintText: "Enter your weight",
                              hintStyle: TextStyle(fontSize: 14),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              iconColor: Color(0xCC6BFE9F),
                            ),
                          ),
                        ),
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
                      )),
                      Expanded(child: Container(),),
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