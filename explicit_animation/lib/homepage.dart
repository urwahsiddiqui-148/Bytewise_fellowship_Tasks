import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Explicit Animation Demo'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation!,
          builder: (context, child) {
            return Container(
              width: 100.0 + 100.0 * _animation!.value,
              height: 100.0 + 100.0 * _animation!.value,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Continous!',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            );
          },
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
