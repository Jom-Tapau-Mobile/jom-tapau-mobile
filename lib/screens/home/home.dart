import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/screens/userProfile/userProfile.dart';

import 'package:jom_tapau_mobile/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  final AuthService _auth = AuthService();
  late final userInfo;
  Widget build(BuildContext context) {
    //get the current user from the firebase
    _auth.getAuth().authStateChanges().listen((User? user) {
      if (user != null) {
        userInfo = user;
      }
    });
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text('Jom Tapau'),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfile()),
                );
              },
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
                  onTap: () {
                    Navigator.pushNamed(context, '/menu');
                  },
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(
                                  0, 3), // changes the position of the shadow
                            ),
                          ],
                        ),
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color.fromRGBO(247, 247, 247, 1),
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
                                  "Today's Menu",
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
                SizedBox(
                  height: 40,
                ),
                //My order
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(
                                  0, 3), // changes the position of the shadow
                            ),
                          ],
                        ),
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color.fromRGBO(247, 247, 247, 1),
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
                SizedBox(
                  height: 40,
                ),
                //Subscription
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(
                                  0, 3), // changes the position of the shadow
                            ),
                          ],
                        ),
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color.fromRGBO(247, 247, 247, 1),
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
