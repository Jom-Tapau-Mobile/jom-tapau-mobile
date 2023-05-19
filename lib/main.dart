import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jom_tapau_mobile/models/user.dart';
import 'package:jom_tapau_mobile/screens/wrapper.dart';
import 'package:jom_tapau_mobile/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
        initialData: null,
        catchError: (_, __) {},
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper() ,
          debugShowCheckedModeBanner: false,
        ));
  }
}
