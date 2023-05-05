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
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Jom Tapau'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
          child: Text(
            "Sign In Anonymounsly",
            style: TextStyle(backgroundColor: Colors.amberAccent),
          ),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            print('hello');
            if (result == null) {
              print('error');
            } else
              print(result.uid);
          },
        ),
      ),
    );
  }
}
