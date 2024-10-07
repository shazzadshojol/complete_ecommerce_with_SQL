import 'dart:convert';
import 'dart:developer';

import 'package:complete_ecommerce/users/data/models/user_model.dart';
import 'package:complete_ecommerce/users/saved_preferences/saved_preferences.dart';
import 'package:complete_ecommerce/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmailOtpController extends GetxController {
  final RxBool _inProgress = false.obs;

  final TextEditingController _emailController = TextEditingController();

  bool get inProgress => _inProgress.value;

  TextEditingController get emailController => _emailController;

  Future<bool> signIn(String userEmail) async {
    _inProgress.value = true;
    update();

    try {
      final UserModel userData = UserModel(userEmail: userEmail);

      final response = await http.post(
        Uri.parse(Api.emailOtp),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(userData.toJson()),
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final resBody = jsonDecode(response.body);
        if (resBody['success'] == true) {
          await SavedPreferences.saveUserData(userData);
          Get.snackbar('Success', 'Email otp sent successful');
          return true;
        } else {
          Get.snackbar('Error', resBody['message'] ?? 'Unknown error occurred');
          return false;
        }
      } else {
        Get.snackbar('Error', 'Server error: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log('Error: $e');
      Get.snackbar(
          'Error', 'An error occurred while email otp in. Please try again.');
      return false;
    } finally {
      _inProgress.value = false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
