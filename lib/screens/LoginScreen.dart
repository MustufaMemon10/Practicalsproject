import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicalexam/controller/login_controller.dart';
import 'package:practicalexam/utils/constants/Sizes.dart';
import 'package:practicalexam/utils/constants/colors.dart';
import 'package:practicalexam/utils/validators/validator.dart';

import '../common/widgets/CustomTextField.dart';
import '../common/widgets/Custombutton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return
      Obx(
          ()=> Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Login',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        body:
          controller.isLoading.value ? const Center(child: CircularProgressIndicator()):
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: AppSizes.sm,
                ),
                CustomTextField(
                  controller: controller.email,
                  validator: (value) => Validator.validateEmail(value),
                  icon: Icons.mail,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: AppSizes.sm,
                ),
                CustomTextField(
                  controller: controller.password,
                  icon: Icons.lock,
                  validator: (value) => Validator.validatePassword(value),
                  showPassword: true,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                Text(
                  'Organization Url',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: AppSizes.sm * 1.3,
                ),
                CustomTextField(
                  controller: controller.ogUrl,
                  icon: Icons.account_balance,
                  validator: (value) => Validator.validateEmptyText('Organization Url', value)
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                CustomButton(
                  title: 'Login',
                  onTap: ()=>controller.loginWithEmailAndPassword(),
                )
              ],
            ),
          ),
        ),
            ),
      );
  }
}

