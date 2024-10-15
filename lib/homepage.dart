import 'package:flutter/material.dart';
import 'package:move_list/homepage.dart';
import 'package:move_list/login_page.dart';
import 'package:move_list/movie_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.amberAccent),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                // Clear login state from SharedPreferences
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('isLoggedIn');

                // Navigate to LoginPage
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) {
                    return const LoginPage();
                  }),
                );
              },
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.amberAccent),
              ))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "asset/img4.webp",
                ))),
        child: Center(
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MovieListScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 200, // Adjusted size for better interaction
                    alignment: Alignment.topCenter,
                    color: const Color.fromARGB(49, 20, 0, 27),
                    child: const Text(
                      "Your Movies",
                      style: TextStyle(
                        fontSize: 23,
                        fontStyle: FontStyle.italic,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
