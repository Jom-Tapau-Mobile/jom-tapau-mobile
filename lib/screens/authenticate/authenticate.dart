import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/screens/authenticate/login.dart';
import 'package:jom_tapau_mobile/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  @override
  Widget build(BuildContext context) {
    void toggleView() {
      setState(() => showSignIn = !showSignIn);
    }

    if (showSignIn) {
      return Container(
        child: SignIn(toggleView: toggleView),
      );
    } else {
      return Container(
        child: Login(toggleView: toggleView),
      );
    }
  }
}
