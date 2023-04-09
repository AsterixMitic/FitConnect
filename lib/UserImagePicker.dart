import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker({Key? key}) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  late File _pickedImage;
  var userId = FirebaseAuth.instance.currentUser!.uid;
  var imagePicking = true;
  XFile? pickedImage;
  var imageChange =true;
  String imageUrl = "";
  late NetworkImage profileImage;

  void pickAnImage() async {
    ImagePicker _picker = new ImagePicker();
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 1);
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image ')
        .child(userId + ".jpg");
    await ref.putFile(File(image!.path));
    imageUrl = await ref.getDownloadURL();

    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .update({'picture': imageUrl});
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
          future:
              FirebaseFirestore.instance.collection("users").doc(userId).get(),
          builder: (context, snapshot) {
            
              profileImage = NetworkImage(snapshot.data!['picture']);
              imageChange = false;
              return Stack(children: [
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
