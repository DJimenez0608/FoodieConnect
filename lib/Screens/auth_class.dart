import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie_connect/Screens/home_screen/home_screen.dart';
import 'package:foodie_connect/Screens/login_screen/login_screen.dart';

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
}
