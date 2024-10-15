import 'package:flutter/material.dart';
import 'package:move_list/homepage.dart';
import 'package:move_list/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

//  late SharedPreferences sharedPreferences;
void main (){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      debugShowCheckedModeBanner: false,
      // home:const HomeScreen(),
      home: const Splashscreen(),
    );
  }
}
