import 'package:cloud_firestore/cloud_firestore.dart';
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
  // final docRef = db.collection('users').doc();
}
