import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:jom_tapau_mobile/screens/cart/cart.dart';

import 'package:jom_tapau_mobile/screens/userProfile/userProfile.dart';
import 'package:jom_tapau_mobile/services/auth.dart';
import '../../services/api_services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  var cart = 0;
  final AuthService _auth = AuthService();
  var cartF = FlutterCart();
  late final userInfo;
  List<dynamic> _cartItems = [];

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
      ),
      body: FutureBuilder(
        future: getFood(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var data = snapshot.data;
            ////////////////////////
            List<dynamic> foods = data as List<dynamic>;
            // print(foods);

            return GridView.builder(
              itemCount: foods.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0 / 1.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 150.0, // Set the desired width
                          height: 150.0, // Set the desired height
                          child: Image.network(
                            "${foods[index]['imgURL']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "${foods[index]['name']}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Center(
                                child: Text(
                                  "RM ${foods[index]['price']}",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Center(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.red),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      var searchItem = foods[index]['_id'];

                                      var foundItem = _cartItems.firstWhere(
                                          (item) => item['_id'] == searchItem,
                                          orElse: () => '');
                                      if (foundItem.isNotEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Item Already Added , to increase quantity go to the cart"),
                                          ),
                                        );
                                      } else {
                                        _cartItems.add(foods[index]);
                                      }
                                    });
                                    print(_cartItems);
                                    // cart = cart + 1;
                                  },
                                  child: Text('Add to Cart'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShoppingCartPage(cartItems: _cartItems),
            ),
          );
        },
      ),
    );
  }
}
