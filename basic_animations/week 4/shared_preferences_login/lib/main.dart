import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Demo',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    _buildContext = context; // Store the BuildContext
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 10, 8, 8),
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        // Changed here to center the content
        child: SingleChildScrollView(
          // Added for scrollability on small screens
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensure the Column takes up minimum space
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hoverColor: Color.fromARGB(235, 245, 240, 240),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      // Store email and password in shared preferences
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('email', email);
                      prefs.setString('password', password);

                      // Navigate to home screen if email and password are correct
                      if (email == 'urwahshafiq23@gmail.com' &&
                          password == '123') {
                        if (mounted) {
                          Navigator.pushReplacement(
                            _buildContext, // Use the stored BuildContext
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        }
                      } else {
                        if (mounted) {
                          ScaffoldMessenger.of(_buildContext).showSnackBar(
                            // Use the stored BuildContext
                            const SnackBar(
                              content: Text(
                                'Invalid email or password !! Please Try Again',
                              ),
                              backgroundColor: Color.fromARGB(255, 150, 79, 74),
                            ),
                          );
                        }
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
