import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/services/auth.dart';
import 'package:jom_tapau_mobile/snackbar.dart';
import '../../services/api_services.dart';

class EditFoodForm extends StatefulWidget {
  final List<dynamic> data;
  const EditFoodForm({required this.data});

  @override
  State<EditFoodForm> createState() => _EditFoodFormState();
}

class _EditFoodFormState extends State<EditFoodForm> {
  String name = '';
  String price = '';
  String imgURL = '';
  String description = '';
  String category = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    print(widget.data[0]['name']);
    AuthService _auth = AuthService();
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.red);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
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
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Edit Food',
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                        hintText: 'Enter Food Name',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    onChanged: (val) {
                      setState(() => name = val);
                      print(name);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter Food Img URL',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    cursorColor: Colors.red,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => imgURL = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter Food Description',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    cursorColor: Colors.red,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => description = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter Food Category',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    cursorColor: Colors.red,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => category = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter Food Price',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    cursorColor: Colors.red,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => price = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: style,
                      onPressed: () {
                        var foodObj = {
                          "name": name,
                          "price": price,
                          "imgURL": imgURL,
                          "category": category,
                          "description": description
                        };

                        var errorData = postData(foodObj);

                        showSnackbar(context);
                        print(foodObj);
                      },
                      child: Text('Add Food')),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "error",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
