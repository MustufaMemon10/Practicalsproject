
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.icon,
    this.showPassword = false,
    this.validator,
  });

  final TextEditingController controller;
  final IconData icon;
  final bool showPassword;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,

      /// Email Controller
      obscureText: showPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
      ),
    );
  }
}