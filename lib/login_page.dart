import 'package:flutter/material.dart';
import 'package:move_list/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers to retrieve text field input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // GlobalKey to validate the form
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Check if the user is already logged in
  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    
    if (isLoggedIn ?? false) {
      _navigateToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 43, 43),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              // App Logo or Icon
              const Icon(
                Icons.lock_outline,
                size: 100,
                color: Colors.amberAccent,
              ),
              const SizedBox(height: 20),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
                ),
              ),
              const SizedBox(height: 40),

              // Login Form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email TextField
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Password TextField
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _performLogin();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Forgot password link
                    TextButton(
                      onPressed: () {
                        // Handle "Forgot Password" action
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.amberAccent),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // Sign Up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle navigation to sign up page
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Simulate login process and save login status using SharedPreferences
  void _performLogin() async {
    String email = _emailController.text;

    // Simulating authentication logic
    // Save login status to shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('email', email);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Login successful! Email: $email"),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate to Home Screen after login
    _navigateToHome();
  }

  void _navigateToHome() {
    // Navigation logic to home or another page
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const DemoPage()), // Replace HomePage with actual page
    );
  }
}
