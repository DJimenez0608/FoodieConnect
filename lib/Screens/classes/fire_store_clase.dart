import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_connect/Screens/classes/user_class.dart';

class FireStoreclase {
  //ROUT TO USER COLLECTION
  final CollectionReference firestoreUser =
      FirebaseFirestore.instance.collection("users");
  //ADD USER IN THE COLLECTION
  Future<void> saveUser(UserC user) async {
    final userToJson = user.toJson();
    await firestoreUser.doc(user.email).set(userToJson);
  }

  //SAVE POST IN THE COLLECTION

  //GET USER INFO

  Future<Map<String, dynamic>> getUserInfo() async {
    final userFireAuthEmail = FirebaseAuth.instance.currentUser!.email;

    if (userFireAuthEmail == null) {
      throw Exception('No hay un usuario autenticado.');
    }

    final docRef = await firestoreUser.doc(userFireAuthEmail.toString()).get();
    final docInfo = docRef.data() as Map<String, dynamic>?;

    if (docInfo != null) {
      print('Nombre: ${docInfo['email']}');
      return docInfo;
    } else {
      print('El documento no tiene datos.');
      return {}; // Retorna un mapa vacío si no hay datos
    }
  }

  // final docRef = db.collection('users').doc();
}
