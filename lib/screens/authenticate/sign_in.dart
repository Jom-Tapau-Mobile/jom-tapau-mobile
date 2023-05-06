import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({super.key, required this.toggleView});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String phoneNumber = '';
  String role = "User";
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
              child: Text('Login', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                widget.toggleView();
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              tooltip: 'Register',
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
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Please Register to Continue',
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                        hintText: 'Enter Name',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    onChanged: (val) {
                      setState(() => phoneNumber = val);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
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
                    validator: (val) => val!.length < 7
                        ? 'Enter more than 7 digit Password'
                        : null,
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
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth.registerWithEmail(
                              name, email, password);
                          if (result == null) {
                            setState(
                                () => error = "Please supply a valid email");
                          } else {
                            if (result == "email-already-in-use") {
                              setState(() => error = result);
                            }
                            await _auth.registerWithEmail(
                                name, email, password);
                          }
                        }
                      },
                      child: Text('Register')),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      error,
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
