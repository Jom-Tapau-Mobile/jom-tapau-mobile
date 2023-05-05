import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          centerTitle: true,
          elevation: 0.0,
          title: Text('Jom Tapau'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Form(
            child: Column(
              
              children: <Widget>[
                
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  onChanged: (val) {},
                ),
                SizedBox(
                  height: 10.0,
                 
                ),
                TextFormField(
                  
                  obscureText: true,
                  onChanged: (val) {},
                )
              ],
            ),
          ),
        ));
  }
}
