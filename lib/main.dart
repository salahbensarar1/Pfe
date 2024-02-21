import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'intro.dart';

main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOGIN',
      home: IntroScreen(),
    );
  }
}
