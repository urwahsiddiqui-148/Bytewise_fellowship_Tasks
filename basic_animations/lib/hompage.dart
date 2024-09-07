import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Basic Animation Demo',
          textAlign: TextAlign.right,
          style: TextStyle(
              fontSize: 25, fontFamily: 'Lobster', color: Colors.black),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            width: _isExpanded ? 200.0 : 100.0,
            height: _isExpanded ? 200.0 : 100.0,
            color: _isExpanded ? Colors.blue : Colors.yellow,
            alignment: _isExpanded ? Alignment.center : Alignment.topCenter,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            padding: const EdgeInsets.all(8.0),
            child: const FlutterLogo(size: 71),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
}
