// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theming_in_flutter/modleview.dart';
import 'view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 5, 240, 181),
          appBar: AppBar(
            leading: const Icon(
              Icons.menu_book_outlined,
              size: 30,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            centerTitle: true,
            title: const Text('MVVM Example',
                style: TextStyle(
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(249, 245, 241, 242))),
            backgroundColor: const Color.fromARGB(171, 0, 0, 0),
            elevation: 10.0,
          ),
          body: const CounterView(),
        ),
      ),
    );
  }
}
