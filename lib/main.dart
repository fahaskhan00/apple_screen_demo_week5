import 'package:flutter/material.dart';

import 'package:flutter_application_2/screens/splash_screen.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'userLoggedIn';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: SplashScreen(),
    );
  }
}
