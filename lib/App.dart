import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicalexam/screens/LoginScreen.dart';
import 'package:practicalexam/screens/add_og_Screen.dart';
import 'package:practicalexam/utils/theme/TextFormField.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Practical App',
      theme: ThemeData(
        inputDecorationTheme: TextFormFieldTheme.textFieldTheme,
      ),
      debugShowCheckedModeBanner: false,
      home:  LoginScreen(),
    );
  }
}
