import 'package:firebase_auth/firebase_auth.dart';
import 'package:jom_tapau_mobile/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebase(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser?> get user {
    return 
   
    _auth.authStateChanges().map((User? user) => _userFromFirebase(user!));
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
}
