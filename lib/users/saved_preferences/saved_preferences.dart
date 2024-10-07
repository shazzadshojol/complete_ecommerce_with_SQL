// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:complete_ecommerce/users/data/models/user_model.dart';
// import 'package:complete_ecommerce/users/screens/authentication/login_screen.dart';
// import 'package:complete_ecommerce/users/screens/home_screen.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SavedPreferences {
//   static Future<void> saveUserData(UserModel userData) async {
//     try {
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       String userDataJson = jsonEncode(userData.toJson());
//       await preferences.setString('userData', userDataJson);
//     } catch (e) {
//       log("Error saving user data: $e");
//     }
//   }
//
//   static Future<UserModel?> getUserData() async {
//     try {
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       String? userInfo = preferences.getString('userData');
//
//       if (userInfo != null) {
//         Map<String, dynamic> decodedJson = jsonDecode(userInfo);
//         return UserModel.fromJson(decodedJson);
//       }
//     } catch (e) {
//       log("Error retrieving user data: $e");
//     }
//     return null;
//   }
//
//   static Future<void> isLoggedIn() async {
//     UserModel? userdata = await getUserData();
//     userdata != null
//         ? Get.off(() => const HomeScreen())
//         : Get.to(() => const LoginScreen());
//   }
//
//   static Future<void> clearUserData() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     await preferences.remove('userData');
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:complete_ecommerce/users/data/models/user_model.dart';
import 'package:complete_ecommerce/users/screens/authentication/login_screen.dart';
import 'package:complete_ecommerce/users/screens/bottom_nav_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedPreferences {
  static const String _userDataKey = 'userData';
  static const String _isLoggedInKey = 'isLoggedIn';

  static Future<void> saveUserData(UserModel userData) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String userDataJson = jsonEncode(userData.toJson());
      await preferences.setString(_userDataKey, userDataJson);
      await preferences.setBool(_isLoggedInKey, true);
    } catch (e) {
      log("Error saving user data: $e");
    }
  }

  static Future<UserModel?> getUserData() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? userInfo = preferences.getString(_userDataKey);

      if (userInfo != null) {
        Map<String, dynamic> decodedJson = jsonDecode(userInfo);
        return UserModel.fromJson(decodedJson);
      }
    } catch (e) {
      log("Error retrieving user data: $e");
    }
    return null;
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> checkLoginStatus() async {
    bool loggedIn = await isLoggedIn();
    if (loggedIn) {
      Get.off(() => BottomNavBarScreen());
    } else {
      Get.to(() => const LoginScreen());
    }
  }

  static Future<void> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_userDataKey);
    await preferences.setBool(_isLoggedInKey, false);
  }
}
