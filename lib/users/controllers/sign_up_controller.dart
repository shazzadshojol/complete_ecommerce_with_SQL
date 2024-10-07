import 'dart:convert';
import 'dart:developer';

import 'package:complete_ecommerce/users/data/models/user_model.dart';
import 'package:complete_ecommerce/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  final RxBool _inProgress = false.obs;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool get inProgress => _inProgress.value;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get nameController => _nameController;

  Future<bool> signup(
      String fullName, String userEmail, String userPassword) async {
    _inProgress.value = true;
    update();

    try {
      final UserModel userData = UserModel(
          fullName: fullName, userEmail: userEmail, userPassword: userPassword);

      final response = await http.post(
        Uri.parse(Api.signUp),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(userData.toJson(isSignUp: true)),
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final resBody = jsonDecode(response.body);
        if (resBody['success']) {
          Get.snackbar('Success', 'Signup successful');
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
          'Error', 'An error occurred while signing up. Please try again.');
      return false;
    } finally {
      _inProgress.value = false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
