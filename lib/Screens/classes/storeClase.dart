import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Storeclase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //ROUT TO USER COLLECTION
  CollectionReference firestoreUser =
      FirebaseFirestore.instance.collection("users");
  //ADD USER IN THE COLLECTION
  Future<void> saveUser(Map user) async {
    await firestoreUser.add(user);
  }

  //SAVE POST IN THE COLLECTION
}
