import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_3/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();

  final Future<void> _prefs = SharedPreferences.getInstance();

  Future<void> saveName() async {
    try {
      print('im hrer');

      var headers = {
        'Content-Type': 'application/json',
      };

      var url = Uri.parse(APIEndPoints.baseUrl);

      Map body = {
        'name': nameController.text
      };

      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      ).timeout(Duration(seconds: 10));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}'); // Add this to see the actual response
      print('Response headers: ${response.headers}'); // This can help debug

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Many APIs return 201 for successful creation
        Get.snackbar('Success', 'Name saved successfully');
      } else {
        throw Exception('Failed to save name. Status: ${response.statusCode}, Body: ${response.body}');
      }


      Get.snackbar('Success', 'Name saved successfully');
    } catch (e) {
      print('Error saving name: $e');
      // Get.snackbar('Error', 'Failed to save name: $e');
    }
  }
}

