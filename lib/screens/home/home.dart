import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/services/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  final AuthService _auth = AuthService();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 214, 214),
      appBar: AppBar(
        title: Text('Jom Tapau'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          TextButton(
            child: Text('Logout', style: TextStyle(color: Colors.white)),
            onPressed: () {},
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
