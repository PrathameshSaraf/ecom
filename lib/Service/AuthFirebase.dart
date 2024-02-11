import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../App/app.router.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isUserLoggedIn() async {
    return _auth.currentUser != null;
  }

  Future<bool> loginUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login successful'),
        ),
      );

      return true;
    } catch (error) {
      if (error is FirebaseAuthException && error.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Incorrect password'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(error.toString()),
          ),
        );
      }

      return false;
    }
  }

  Future<bool> signUpUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Sign up successful'),
        ),
      );
      return true;
    } catch (error) {
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'email-already-in-use':
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('Email already in use'),
              ),
            );
            break;
          case 'weak-password':
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('Password is too weak'),
              ),
            );
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('An error occurred. Please try again later.'),
              ),
            );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('An error occurred. Please try again later.'),
          ),
        );
      }

      return false;
    }
  }

  Future<void> logoutUser(BuildContext context) async {
    try {
      await _auth.signOut();

      Navigator.pushNamedAndRemoveUntil(
          context, Routes.loginScreen, (route) => false);


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Logged out successfully'),
        ),
      );
    } catch (error) {
      // Show an error message if logout fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    }
  }
}
