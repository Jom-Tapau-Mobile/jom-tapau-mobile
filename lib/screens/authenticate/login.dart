import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/services/auth.dart';

class Login extends StatefulWidget {
  final Function toggleView;

  const Login({Key? key, required this.toggleView}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );

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
        title: Text(
          'Jom Tapau',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Please Login to Continue',
                style: TextStyle(color: Colors.red, fontSize: 28),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                cursorColor: Colors.red,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: style,
                onPressed: () async {
                  dynamic result = await _auth.loginWithEmail(email, password);
                  if (result == null) {
                    setState(() => error = "Please supply a valid email");
                  } else if (result == "user-not-found" ||
                      result == "wrong-password") {
                    setState(() => error = result);
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  RegExp emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (emailRegex.hasMatch(email)) {
                    dynamic result = _auth.sendPasswordReset(email);
                    setState(() => error =
                        "Reset Password Email has been sent to your email. Please check.");
                  } else {
                    setState(() => error = "Please provide a valid email");
                  }
                },
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
