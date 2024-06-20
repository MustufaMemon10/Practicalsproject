import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:practicalexam/common/loaders/loaders.dart';
import 'package:practicalexam/screens/home_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// variables
  final email = TextEditingController();
  final password = TextEditingController();
  final ogUrl = TextEditingController();
  final isLoading = false.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();

  /// Functions
  Future<void> loginWithEmailAndPassword() async {
    try {
      isLoading.value = true;
      const apiUrl = "http://122.170.12.63:90/api/auth/login";
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email.text,
          'password': password.text,
          'organizationUrl': ogUrl.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final token = responseBody['token'];

        await storage.write(key: 'auth_token', value: token);

        Get.offAll(() => const HomeScreen());
        Get.snackbar('Success', 'Login Successful', snackPosition: SnackPosition.BOTTOM);
      } else {
        final responseBody = json.decode(response.body);
        Get.snackbar('Error', responseBody['message'], snackPosition: SnackPosition.BOTTOM);
        print(responseBody['message']);
      }
    }catch (e) {
      isLoading.value = false;
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      print(e.toString());
    }
  }
}
