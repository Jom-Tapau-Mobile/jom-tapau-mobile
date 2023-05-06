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
            width: 350,
            padding: EdgeInsets.all(10.0),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              children: <Widget>[
                //Menu
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
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 30.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.restaurant_menu,
                                  size: 35.0,
                                ),
                                Text(
                                  "Menu",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),

                //My order
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
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 30.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.ramen_dining,
                                  size: 35.0,
                                ),
                                Text(
                                  'My Order',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),

                //Subscription
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
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 30.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.restaurant_menu,
                                  size: 35.0,
                                ),
                                Text(
                                  'Subscription',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
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
