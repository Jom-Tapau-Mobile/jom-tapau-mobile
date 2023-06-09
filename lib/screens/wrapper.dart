import 'package:flutter/material.dart';
import 'package:jom_tapau_mobile/models/user.dart';

import 'package:jom_tapau_mobile/screens/authenticate/authenticate.dart';
import 'package:jom_tapau_mobile/screens/home/home.dart';
import 'package:jom_tapau_mobile/screens/userProfile/userProfile.dart';
import 'package:provider/provider.dart';

import 'admin/adminHomepage.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) print("null");
    print(user);
    if (user == null) {
      return const Authenticate();
    } else if (user.email == "admin@gmail.com") {
      print(user.email);
      return AdminHomePage();
    } else {
      return Home();
    }
  }
}
