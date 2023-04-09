import 'dart:async';
import 'dart:js_interop';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit/models/activity.dart';

import 'models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;
  Database({required this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference challanges =
      FirebaseFirestore.instance.collection("challanges");

  void updateUserData(Client u) {
    final data = u.toMap();
    users
        .doc(uid)
        .set(data, SetOptions(merge: true))
        .onError((error, stackTrace) => print(error));
  }

  Future<Client?> getUserData() async {
    Client? data;

    await users.doc(uid).get().then((querySnapshot) {
      print("Successfully completed");
      var q = querySnapshot.data() as Map<String, dynamic>?;
      if (q != null) {
        try {
          data = Client(
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

  void updateChallangeData(List<ComplitedChallange> c) {
    for (int i = 0; i < c.length; i++) {
      challanges
          .doc("$uid-$i")
          .set(c[i].toMap(uid))
          .onError((error, stackTrace) => null);
    }
  }

  Future<List<ComplitedChallange>> getChallangeData() async {
    List<ComplitedChallange> r = [];
    await challanges.where("uid", isEqualTo: uid).get().then((value) {
      for (var doc in value.docs) {
        print('${doc.id} => ${doc.data()}');
        var q = doc.data() as Map<String, dynamic>;
        var p = q['activity'] as Map<String, dynamic>;
        ComplitedChallange c = ComplitedChallange(
            activity: Activity.fromMap(p),
            slika: q['slika'],
            date: q['date'].toDate(),
            challange: q['challange']);
        r.add(c);
      }
    });
    r.sort((a, b) => a.date.compareTo(b.date));
    return r;
  }
}
