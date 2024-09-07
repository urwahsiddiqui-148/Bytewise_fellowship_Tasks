// ignore_for_file: unused_import, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'dart:convert';

import 'package:working_with_api_calls/hompage.dart';

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
