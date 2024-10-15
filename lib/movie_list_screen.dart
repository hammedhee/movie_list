import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MovieListScreen> {
  // Create a list of 10 movie names
  final List<String> movieNames = [
    'Inception',
    'Interstellar',
    'The Dark Knight',
    'Fight Club',
    'Forrest Gump',
    'The Matrix',
    'Shawshank Redemption',
    'Gladiator',
    'The Godfather',
    'Pulp Fiction',
    'Inception',
    'Interstellar',
    'The Dark Knight',
    'Fight Club',
    'Forrest Gump',
    'The Matrix',
    'Shawshank Redemption',
    'Gladiator',
    'The Godfather',
    'Pulp Fiction',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "You'r Movies",
              style: GoogleFonts.aBeeZee(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20),
            ),
            // const  Icon(
            //     Icons.movie_creation,
            //     color: Color.fromARGB(255, 255, 255, 255),
            //   )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 7, 7, 7),
      ),
      body: Stack(
        children: [
          // Background image covering the entire screen
          Positioned.fill(
            child: Image.asset(
              'asset/img8.webp', // Add your image asset path here
              fit: BoxFit.cover, // Make sure the image covers the whole screen
            ),
          ),
          // List of movies displayed on top of the background
          ListView.builder(
            itemCount: movieNames.length, // Set the number of items to display
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.movie,
                  color: Color.fromARGB(172, 216, 216, 216),
                ),
                title: Text(
                  movieNames[index],
                  style: const TextStyle(
                      color: Colors.white), // Make text color white
                ), // Display each movie name
              );
            },
          ),
        ],
      ),
    );
  }
}
