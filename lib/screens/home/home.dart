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
              onPressed: () async {
                await _auth.signOut();
              },
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
        body: Center(
          child: Container(
            width: 300,
            padding: EdgeInsets.all(10.0),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color.fromRGBO(254, 208, 133, 1),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Icon(
                                  Icons.restaurant_menu,
                                  size: 30.0,
                                ),
                                Text(
                                  'Menu',
                                  style: TextStyle(
                                    fontSize: 36,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
