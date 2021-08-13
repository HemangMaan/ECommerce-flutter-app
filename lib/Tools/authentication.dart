import 'dart:async';
import 'package:GroceryCart/Tools/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:GroceryCart/models/user.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  // Future<void> sendEmailVerification();

  Future<void> signOut();

  // Future<bool> isEmailVerified();

}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  // User _userFromFirebaseUser(FirebaseUser user) {
  //   return user != null ? User(uid: user.uid) : null;
  // }

  //SignIn with email and password

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;

    return user.uid;
  }

  //User SignUp
  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    //create a new document for the user with the uid
    await DatabaseService(uid: user.uid)
        .updateUserData('0', 0, 0, '', 'New User');
    return user.uid;
  }

  //Check if user logged in or not on app launch
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  //User logout
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  // Future<void> sendEmailVerification() async {
  //   FirebaseUser user = await _firebaseAuth.currentUser();
  //   user.sendEmailVerification();
  // }

  // Future<bool> isEmailVerified() async {
  //   FirebaseUser user = await _firebaseAuth.currentUser();
  //   return user.isEmailVerified;
  // }
}
