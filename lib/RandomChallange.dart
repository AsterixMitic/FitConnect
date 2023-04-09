import 'dart:ui';

import 'package:fit/main_challenges.dart';
import 'package:flutter/material.dart';


class RandomChallangeView extends StatefulWidget {
  const RandomChallangeView({super.key});

  @override
  State<RandomChallangeView> createState() => _RandomChallangeViewState();
}

class _RandomChallangeViewState extends State<RandomChallangeView> {
  @override
  Widget build(BuildContext context) {
    int? index = ModalRoute.of(context)!.settings.arguments as int?;

    

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
                  
                  const Text(
                    "Your challange is to suck cock for 24 hours:",
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
                                child: Icon(
                                  Icons.image,
                                  size: 100,
                                )),
                          ),
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
                    "Enter Required Data!",
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
                            child: TextField(
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.monitor_weight_rounded,
                                  size: 20,
                                ),
                                hintText: "Enter your data:",
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


                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {},
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
                      Navigator.pop(
                        context
                      );
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
