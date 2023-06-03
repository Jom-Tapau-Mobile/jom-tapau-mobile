import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jom_tapau_mobile/screens/admin/editFood.dart';
import 'package:jom_tapau_mobile/screens/admin/orderPending.dart';
import 'package:jom_tapau_mobile/services/api_services.dart';

import 'package:jom_tapau_mobile/screens/userProfile/userProfile.dart';

import 'package:jom_tapau_mobile/services/auth.dart';

import 'addFood.dart';

class AdminHomePage extends StatelessWidget {
  AdminHomePage({super.key});
  AuthService _auth = AuthService();
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
                //My order
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddFood()));
                  },
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
                                  'Add Food',
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

                //Edit Food
                GestureDetector(
                  onTap: () {
                    getData().then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditFood(data: value)));
                    });
                  },
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
                                  Icons.edit,
                                  size: 35.0,
                                ),
                                Text(
                                  'Edit Food',
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
                                  'Report',
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
                //Order Pendings
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderPending()),
                    );
                  },
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
                                Icons.pending,
                                size: 35.0,
                              ),
                              Text(
                                'Order Pending',
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
