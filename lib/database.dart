import 'dart:async';
import 'models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;
  Database({required this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  void updateUserData(User u) {
    final data = u.toMap();
    users
        .doc(uid)
        .set(data, SetOptions(merge: true))
        .onError((error, stackTrace) => print(error));
  }

  User? getUserData() {
    User? data;
    users.doc(uid).get().then((querySnapshot) {
      print("Successfully completed");
      var q = querySnapshot.data() as Map<String, dynamic>?;
      if (q != null) {
        try {
          data = User(
              name: q['name'],
              lastname: q['lastname'],
              email: q['email'],
              height: q['height'],
              weight: q['weight'],
              picture: q['picture']);
        } catch (_, e) {
          print(e);
          data = null;
        }
      }
    }).onError((error, stackTrace) => null);
    return data;
  }
}