import 'package:flutter/material.dart';
import 'package:xo_secion/namesScree.dart';
import 'package:xo_secion/xo_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NamesScreen.routeName,
      routes:{
        XO_Screen.routeName : (context) => XO_Screen(),
        NamesScreen.routeName : (context) => NamesScreen(),

      },
    );
  }
}


