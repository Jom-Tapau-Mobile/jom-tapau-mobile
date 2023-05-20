import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/services/auth.dart';
import '../../services/api_services.dart';

class EditFood extends StatefulWidget {
  const EditFood({super.key});

  @override
  State<EditFood> createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  AuthService _auth = AuthService();
  Future<List> foodItems = getData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 214, 214),
      appBar: AppBar(
        title: Text('Admin'),
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
