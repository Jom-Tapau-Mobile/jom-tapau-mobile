import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/services/api_services.dart';
import 'package:jom_tapau_mobile/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class myOrder extends StatefulWidget {
  const myOrder({super.key});

  @override
  State<myOrder> createState() => _myOrderState();
}

class _myOrderState extends State<myOrder> {
  AuthService _auth = AuthService();
  User? user = FirebaseAuth.instance.currentUser;
  var data = getUserOrder("systematicsquad69@gmail.com");

  @override
  Widget build(BuildContext context) {
    print(user?.email);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
