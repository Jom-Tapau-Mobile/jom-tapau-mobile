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
        title: Text('Jom Tapau- Profile'),
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
          SizedBox(
            height: 50,
          ),
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
                user?.displayName ?? "GM Shimon",
                style: TextStyle(fontSize: 24, color: Colors.amber),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.military_tech_sharp,
                    size: 60.0,
                    color: Colors.grey[500],
                  ),
                  SizedBox(width: 8.0),
                  Text("500 Points", style: TextStyle(fontSize: 20.0)),
                  Text(": Silver", style: TextStyle(fontSize: 20.0)),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.rice_bowl_sharp, size: 70),
                          Text(
                            "Order",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.notifications_active_outlined, size: 70),
                          Text(
                            "Promotion",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.wallet_outlined, size: 70),
                          Text(
                            "Wallet",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.help_outline_rounded, size: 70),
                          Text(
                            "Help",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.album_outlined, size: 70),
                          Text(
                            "About",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.settings_applications_outlined, size: 70),
                          Text(
                            "Settings",
                            style: TextStyle(fontSize: 20),
                          ),
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
