import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive & Adaptive Design',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Responsive Design',
          textAlign: TextAlign.center,
          style: TextStyle(
            backgroundColor: Color.fromARGB(255, 52, 47, 58),
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Container(
                color: Colors.teal[100],
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Responsive & Adaptive Design Demo',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.teal[200],
                        child: const Center(
                          child: Text(
                            'Left Pane area',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        color: Colors.teal[400],
                        child: const Center(
                          child: Text(
                            'Center Pane area',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.teal[200],
                        child: const Center(
                          child: Text(
                            'Right Pane area',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: constraints.maxWidth < 600 ? 3 / 1 : 16 / 9,
                child: Container(
                  color: Colors.teal[700],
                  child: const Center(
                    child: Text('Aspect Ratio Box'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
