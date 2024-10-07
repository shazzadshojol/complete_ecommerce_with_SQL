import 'dart:convert';
import 'dart:developer';

import 'package:complete_ecommerce/users/data/models/user_model.dart';
import 'package:complete_ecommerce/users/saved_preferences/saved_preferences.dart';
import 'package:complete_ecommerce/users/screens/authentication/login_screen.dart';
import 'package:complete_ecommerce/users/screens/bottom_nav_screen.dart';
import 'package:complete_ecommerce/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  final RxBool _inProgress = false.obs;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get inProgress => _inProgress.value;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    bool isLoggedIn = await SavedPreferences.isLoggedIn();
    if (isLoggedIn) {
      Get.off(() => BottomNavBarScreen());
    }
  }

  Future<bool> signIn(String userEmail, String userPassword) async {
    _inProgress.value = true;
    update();

    try {
      final UserModel userData =
          UserModel(userEmail: userEmail, userPassword: userPassword);

      final response = await http.post(
        Uri.parse(Api.logIn),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(userData.toJson(isLogIn: true)),
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final resBody = jsonDecode(response.body);
        if (resBody['success'] == true) {
          await SavedPreferences.saveUserData(userData);
          Get.snackbar('Success', 'SignIn successful');
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
          'Error', 'An error occurred while signing in. Please try again.');
      return false;
    } finally {
      _inProgress.value = false;
    }
  }

  Future<void> signOut() async {
    await SavedPreferences.clearUserData();
    Get.offAll(() => const LoginScreen());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
