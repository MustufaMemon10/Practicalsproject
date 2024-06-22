import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicalexam/controller/og_controller.dart';

class ShowOgScreen extends StatelessWidget {
  ShowOgScreen({super.key});

  final controller = Get.put(OgController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          physics: const AlwaysScrollableScrollPhysics(),
                itemCount: controller.organizations.length,
                itemBuilder: (context, index) {
                  final organization = controller.organizations[index];
                  return ListTile(
                    title: Text(organization.name),
                    subtitle: Column(
                      children: [
                        Text(organization.shortName),
                        Text(organization.url),
                        Text(organization.logo),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
