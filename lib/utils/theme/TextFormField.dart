import 'package:flutter/material.dart';
import 'package:practicalexam/utils/constants/colors.dart';

class TextFormFieldTheme{
  TextFormFieldTheme._();

  static InputDecorationTheme textFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
      prefixIconColor: Colors.black,
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
      border:  OutlineInputBorder(
        borderSide: const BorderSide(width: 1.0,color: AppColors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder:  OutlineInputBorder(
        borderSide: const BorderSide(width: 1.0,color: AppColors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      filled: true,
      fillColor: AppColors.primary.withOpacity(0.1)
  );


}