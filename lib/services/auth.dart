import 'package:firebase_auth/firebase_auth.dart';
import 'package:jom_tapau_mobile/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth getAuth() {
    return _auth;
  }

  AppUser? _userFromFirebase(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? AppUser(uid: user.uid, email: user.email) : null;
  }

  Stream<AppUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  Future sendPasswordReset(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      String successCode = "Password reset has been sent please check email";
      return successCode;
    } catch (e) {
      String errorCode = "Please enter a valid email";
      return errorCode;
    }
  }

  Future loginWithEmail(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
          
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return e.code;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return e.code;
      }
    }
   
  }

  Future registerWithEmail(
      String name, String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return e.code;
      }
    } catch (e) {
      print(e);
    }

  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print('Error signing in anonymously: $e');
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
