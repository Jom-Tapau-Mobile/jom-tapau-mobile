import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jom_tapau_mobile/services/auth.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  const Login({super.key, required this.toggleView});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.red);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        appBar: AppBar(
          actions: [
            TextButton(
              child: Text('Register', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                widget.toggleView();
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              tooltip: 'Login',
              onPressed: () async {
                widget.toggleView();
              },
            )
          ],
          backgroundColor: Colors.red[400],
          centerTitle: true,
          elevation: 0.0,
          title: Text('Jom Tapau'),
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
                      'Please Login to Continue',
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                        hintText: 'Enter Email',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter Password',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    cursorColor: Colors.red,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: style,
                      onPressed: () async {
                        dynamic result =
                            await _auth.loginWithEmail(email, password);
                        if (result == null) {
                          setState(() => error = "Please supply a valid email");
                        } else {
                          if (result == "user-not-found" ||
                              result == "wrong-password") {
                            setState(() => error = result);
                          }
                        }
                        await _auth.loginWithEmail(email, password);
                      },
                      child: Text('Login')),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      RegExp emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (emailRegex.hasMatch(email)) {
                        dynamic result = _auth.sendPasswordReset(email);
                        setState(() => error =
                            "Reset Password Email has been sent to your email, Please Check");
                      } else {
                        setState(() => error = "Please provide valid email");
                      }
                    },
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
    ;
  }
}
