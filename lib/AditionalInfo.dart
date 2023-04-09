import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/UserImagePicker.dart';
import 'package:fit/database.dart';
import 'package:fit/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'mainscreen.dart';

class AditionalInfo extends StatefulWidget {
  Client? user;
  AditionalInfo({Key? key, this.user}) : super(key: key);

  @override
  State<AditionalInfo> createState() => _AditionalInfoState();
}

class _AditionalInfoState extends State<AditionalInfo> {

  late Client? _user;

  @override
      void initState() {
        super.initState();
        _user = widget.user;
    }

  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    lastnameController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String? currImage;

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
                              child:UserImagePicker(),
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
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 4, left: 8, right: 6),
                                  child: TextField(
                                    controller: nameController,
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
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 4, left: 8, right: 6),
                                  child: TextField(
                                    controller: lastnameController,
                                    textAlignVertical: TextAlignVertical.top,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.person,
                                        size: 20,
                                      ),
                                      hintText: "Enter your lastname",
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
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: 4, left: 8, right: 6),
                          child: TextField(
                            controller: weightController,
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
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: 4, left: 8, right: 6),
                          child: TextField(
                            controller: heightController,
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
                      var uuid = FirebaseAuth.instance.currentUser;

<<<<<<< HEAD

                       Client u = Client(email: uuid!.email.toString());

                       FirebaseFirestore.instance.collection("users").doc(uuid.uid)
                      .update({'name': nameController.text.trim()});
                      FirebaseFirestore.instance.collection("users").doc(uuid.uid)
                      .update({'lastname': lastnameController.text.trim()});
                      FirebaseFirestore.instance.collection("users").doc(uuid.uid)
                      .update({'height': int.parse(heightController.text)});
                      FirebaseFirestore.instance.collection("users").doc(uuid.uid)
                      .update({'weight': int.parse(weightController.text)});
                      //  u.name = nameController.text.trim();
                      //  u.lastname = lastnameController.text.trim();
                      //  u.weight = int.parse(weightController.text);
                      //  u.height = int.parse(heightController.text);
                      //  u.picture = currImage;
                      //  db.updateUserData(u);


=======
>>>>>>> f46267eec145e73e88f14709962df425a6a619f9
                      Navigator.push(context,  MaterialPageRoute(builder: (context) => MainScreenPage(user: _user,)));

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