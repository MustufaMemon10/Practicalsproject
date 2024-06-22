import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicalexam/common/widgets/Custombutton.dart';
import 'package:practicalexam/controller/og_controller.dart';
import 'package:practicalexam/utils/validators/validator.dart';

import '../common/widgets/CustomTextField.dart';
import '../controller/login_controller.dart';
import '../utils/constants/Sizes.dart';

class AddOgScreen extends StatelessWidget {
   AddOgScreen({super.key});

  final controller = Get.put(OgController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Add Organization',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body: Form(
        key: controller.ogKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
          child: Column(
            children: [
              Text(
                'Organization Name',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: AppSizes.sm,
              ),
              CustomTextField(
                controller: controller.name,
                validator: (value) => Validator.validateEmptyText('Organization Name', value),
                icon: Icons.arrow_right,
              ), const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Text(
                'Short Name',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: AppSizes.sm,
              ),
              CustomTextField(
                controller: controller.shortName,
                validator: (value) => Validator.validateEmptyText('Organization Short Name', value),
                icon: Icons.arrow_right,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Text(
                'URL',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: AppSizes.sm,
              ),
              CustomTextField(
                controller: controller.ogUrl,
                validator: (value) => Validator.validateEmptyText('Organization URL', value),
                icon: Icons.arrow_right,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Text(
                'Logo',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: AppSizes.sm,
              ),
              CustomTextField(
                controller: controller.ogLogo,
                validator: (value) => Validator.validateEmptyText('Organization Logo', value),
                icon: Icons.arrow_right,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections,),
              CustomButton(title: 'Add', onTap: ()=> controller.addOrganization()),
            ],
          ),
        ),
      ),
    );
  }
}
