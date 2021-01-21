import 'dart:io';

import 'package:flutter/material.dart';

import 'screens/onboard/onboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget home = Onboard();

  runApp(MyApp(home));
}

class MyApp extends StatelessWidget {
  final Widget page;
  MyApp(this.page);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newsly',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: this.page,
    );
  }
}
