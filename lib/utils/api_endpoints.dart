import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIEndPoints {
  static final String baseUrl = "http://localhost:3000/api/";
}

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();

  final Future<void> _prefs = SharedPreferences.getInstance();
}