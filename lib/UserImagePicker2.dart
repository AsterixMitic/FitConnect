import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker2 extends StatefulWidget {
  final challange_id;
  const UserImagePicker2({super.key, required this.challange_id});

  @override
  State<UserImagePicker2> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker2> {
  late File _pickedImage;
  //var userId = FirebaseAuth.instance.currentUser!.uid;
  var imagePicking = true;
  XFile? pickedImage;
  var imageChange = true;
  String imageUrl = "";
  late NetworkImage profileImage;

  void pickAnImage() async {
    ImagePicker _picker = new ImagePicker();
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 1);
    final ref = FirebaseStorage.instance
        .ref()
        .child('challange_image ')
        .child(widget.challange_id + ".jpg");
    await ref.putFile(File(image!.path));
    imageUrl = await ref.getDownloadURL();

    FirebaseFirestore.instance
        .collection("challanges")
        .doc(widget.challange_id)
        .update({'slika': imageUrl});
    imageChange = true;
    setState(() {
      pickedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      if (imageChange)
        FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("challanges")
              .doc(widget.challange_id)
              .get(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return Container(
            //     alignment: Alignment.center,
            //     child: Image.asset(
            //       "images/profileIcon.png",
            //       height: 140,
            //     ),
            //   );
            // }
            if (snapshot.data!['slika'] == null) {
              return Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "images/profileIcon.png",
                  height: 150,
                ),
              );
            } else {
              profileImage = NetworkImage(snapshot.data?['slika']);
              imageChange = false;
              return Stack(children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/profileIcon.png",
                    height: 140,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 12, color: Colors.white),
                      shape: BoxShape.circle,
                      color: Colors.transparent),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    backgroundImage: profileImage,
                  ),
                ),
              ]);
            }
          },
        ),
      if (imageChange == false)
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 12, color: Colors.white),
              shape: BoxShape.circle,
              color: Colors.transparent),
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.transparent,
            backgroundImage: profileImage,
          ),
        ),
      Positioned(
        right: 10,
        bottom: 5,
        child: GestureDetector(
          onTap: () {
            pickAnImage();
          },
          child: Container(
            height: 38,
            width: 38,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffc1d4b5),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ]);
  }
}
