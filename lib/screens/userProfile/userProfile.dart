import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/services/auth.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final AuthService _auth = AuthService();
  late final userInfo;
  @override
  Widget build(BuildContext context) {
    //get the current user from the firebase
    _auth.getAuth().authStateChanges().listen((User? user) {
      if (user != null) {
        userInfo = user;
        print(userInfo);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Jom Tapau'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Text("Hello from user Profile"),
    );
  }
}
