import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:practicalexam/common/loaders/loaders.dart';
import 'package:practicalexam/modules/OgModule.dart';

import '../screens/home_screen.dart';

class OgController extends GetxController {
  static OgController get instance => Get.find();

  @override
  void onReady() {
    super.onReady();
    fetchOrganizations();
  }

  // variables
  final name = TextEditingController();
  final shortName = TextEditingController();
  final ogUrl = TextEditingController();
  final ogLogo = TextEditingController();
  final isLoading = false.obs;
  GlobalKey<FormState> ogKey = GlobalKey<FormState>();
  final organizations = <OgModules>[].obs;
  final storage = const FlutterSecureStorage();

  Future<void> fetchOrganizations() async {
    try {
      isLoading.value = true;
      const apiUrl =
          "http://122.170.12.63:90/api/Organization/getAllOrganization";
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final organizationList = responseBody['data']as List;
        organizations.value = OgModules.fromJsonList(organizationList);
      } else {
        Get.snackbar('Error', 'Failed to fetch organizations',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addOrganization() async {
    try {
      final token = await storage.read(key: 'auth_token');
      const apiUrl = "http://122.170.12.63:90/api/Organization/addOrganization";
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'organizationName': name.text.toString(),
          'organizationShortName': shortName.text.toString(),
          'organizationURL': ogUrl.text.toString(),
          'organizationLOGO': ogLogo.text.toString(),
        }),
      );
      if (response.statusCode == 200) {
        fetchOrganizations();
        Get.snackbar('Success', 'Organization added successfully', snackPosition: SnackPosition.BOTTOM);
        Get.offAll(()=>const HomeScreen());
      } else {
        Get.snackbar('Error', 'Failed to add organization', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
