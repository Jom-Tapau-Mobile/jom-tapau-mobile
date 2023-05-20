import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/services/auth.dart';
import '../../services/api_services.dart';

class EditFood extends StatefulWidget {
  final List<dynamic> data;
  const EditFood({required this.data});

  @override
  State<EditFood> createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    print(widget.data.length);
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
        body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.data.length, (index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(widget.data[index]['name']),
                    onTap: () {
                      print("Hello");
                    },
                  ),
                ),
              );
            })));
  }
}
