// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/all_screens/SingUP.dart';
import 'package:flutter_to_do_list/all_screens/login.dart';

class Auth_Page extends StatefulWidget {
  const Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

class _Auth_PageState extends State<Auth_Page> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LogIN_Screen(to);
    } else {
      return SignUp_Screen(to);
    }
  }
}
