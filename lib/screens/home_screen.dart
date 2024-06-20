import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicalexam/screens/LoginScreen.dart';
import 'package:practicalexam/screens/Show_og_screen.dart';
import 'package:practicalexam/screens/add_og_Screen.dart';
import 'package:practicalexam/utils/constants/Sizes.dart';

import '../common/widgets/Custombutton.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Home Screen',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
      ),
      body:  Padding(padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Column(
          children: [
            CustomButton(title: 'Add Organization Data', onTap: ()=>Get.to(()=> AddOgScreen()),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections
            ),
            CustomButton(title: 'Show Organization Data', onTap: ()=>()=>Get.to(()=>  ShowOgScreen()),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections
            ),
            CustomButton(title: 'Show Organization Data', onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
