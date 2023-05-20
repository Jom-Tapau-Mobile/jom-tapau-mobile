import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/screens/userProfile/userProfile.dart';
import 'package:jom_tapau_mobile/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  final AuthService _auth = AuthService();
  late final userInfo;

  @override
  Widget build(BuildContext context) {
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
    ));
  }
}
