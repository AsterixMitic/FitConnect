import 'dart:async';
import 'dart:js_interop';
import 'models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;
  Database({required this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  void updateUserData(Client u) {
    final data = u.toMap();
    users
        .doc(uid)
        .set(data, SetOptions(merge: true))
        .onError((error, stackTrace) => print(error));
  }

  Future<Client?> getUserData() async {
    Client? data;
    /*
    await users.get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          var q = docSnapshot.data() as Map<String, dynamic>;
          //print('${docSnapshot.id} => ${docSnapshot.data()}');
          data = Client(
              name: q['name'],
              lastname: q['lastname'],
              email: q['email'],
              height: q['height'],
              weight: q['weight'],
              picture: q['picture']);
          return data;
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return data;*/

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
}
