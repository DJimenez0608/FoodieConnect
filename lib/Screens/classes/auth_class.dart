import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // LOGIN FUNCTION
  Future<void> signInWithEmailAndPassword({
    required email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //LOGOUT FUNCTION
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  //CREATE USER
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //LOGIN WITH GOOGLE
  Future<UserCredential> signinWithGoogle() async {
    //Beging auth flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //Obtain auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    //Create the credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );
    //RETURN THE USER CREDENCIAL
    return await _firebaseAuth.signInWithCredential(credential);
  }
}
