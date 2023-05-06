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
    User? user = FirebaseAuth.instance.currentUser;

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Text(user?.displayName ?? 'No display name found',
                  style: TextStyle(fontSize: 24.0)),
              radius: 50.0,
            ),
            SizedBox(height: 16.0),
            Text('Username:', style: TextStyle(fontSize: 18.0)),
            Text(user?.displayName ?? 'No display name found',
                style: TextStyle(fontSize: 24.0)),
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
            Text('Email:', style: TextStyle(fontSize: 18.0)),
            Text(user?.email ?? 'No display name found',
                style: TextStyle(fontSize: 24.0)),
            SizedBox(height: 16.0),
            Text('Bio:', style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}
