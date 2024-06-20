import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practicalexam/controller/og_controller.dart';
import 'package:practicalexam/utils/constants/Sizes.dart';


class ShowOgScreen extends StatelessWidget {
   ShowOgScreen({super.key});
  final controller =  Get.put(OgController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Organization List',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body: Obx(
            () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: controller.organizations.length,
          itemBuilder: (context, index) {
            final organization = controller.organizations[index];
            return ListTile(
              title: Text(organization['organizationName']),
              subtitle: Text(organization['']),
            );
          },
        ),
      ),
    );
  }
}
