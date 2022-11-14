
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:phpsign/sign_in_up/loginpage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PHPSign',
      home:LoginPage(),
    );
  }
}