import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Networking Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String _data = 'Press the button to send data';
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.fastOutSlowIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendData() async {
    try {
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'title': 'foo',
          'body': 'bar',
          'userId': 1,
        }),
      );

      if (response.statusCode == 201) {
        var jsonData = json.decode(response.body);
        setState(() {
          _data = 'Data sent successfully: ${jsonData['title']}';
        });
      } else {
        setState(() {
          _data = 'Failed to send data';
        });
      }
    } catch (e) {
      setState(() {
        _data = 'Error: $e';
      });
    }
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking Example with POST'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideTransition(
              position: _offsetAnimation,
              child: Text(
                _data,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendData,
              child: const Text('Send Data'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(202, 223, 3, 69),
        onTap: _onItemTapped,
      ),
    );
  }
}
