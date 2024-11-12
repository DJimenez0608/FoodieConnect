import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_connect/Screens/classes/user_class.dart';

class Storeclase {
  //ROUT TO USER COLLECTION
  CollectionReference firestoreUser =
      FirebaseFirestore.instance.collection("users");
  //ADD USER IN THE COLLECTION
  Future<void> saveUser(UserC user) async {
    final userToJson = user.toJson();
    await firestoreUser.doc(user.email).set(userToJson);
  }

  //SAVE POST IN THE COLLECTION

  //GET USER INFO

  Future<void> getUserInfo() async {
    final userFireAuthEmail = FirebaseAuth.instance.currentUser?.email;
    if (userFireAuthEmail == null) {
      print("No user logged in");
      return;
    }

    final docRef = firestoreUser.doc(userFireAuthEmail);
    docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print('------------------');
      print(data);
      print('------------------');
    }, onError: (e) => print("Error retrieving user data: $e"));
  }

  // final docRef = db.collection('users').doc();
}
