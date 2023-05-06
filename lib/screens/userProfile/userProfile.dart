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
    //fetch data
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
      body: ListView(
        children: [
          Column(
            children: [
              Icon(
                Icons.account_circle_outlined,
                size: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                user?.displayName ?? "NO Name",
                style: TextStyle(fontSize: 20, color: Colors.amber),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.stars_outlined, size: 32.0),
                  SizedBox(width: 8.0),
                  Text("500 Points", style: TextStyle(fontSize: 16.0)),
                  Text(": Silver", style: TextStyle(fontSize: 16.0)),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.rice_bowl_sharp, size: 60),
                          Text("sad"),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.rice_bowl_sharp, size: 60),
                          Text("sad"),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.rice_bowl_sharp, size: 60),
                          Text("sad"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.rice_bowl_sharp, size: 60),
                          Text("sad"),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.rice_bowl_sharp, size: 60),
                          Text("sad"),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.rice_bowl_sharp, size: 60),
                          Text("sad"),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
