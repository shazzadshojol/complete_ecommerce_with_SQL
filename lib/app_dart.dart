import 'package:complete_ecommerce/controller_binder.dart';
import 'package:complete_ecommerce/users/screens/authentication/login_screen.dart';
import 'package:complete_ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: const LoginScreen(),
      initialBinding: ControllerBinder(),
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        textTheme: _buildTextTheme(),
        inputDecorationTheme: _buildInputDecorationTheme(
            AppColors.primaryColor, AppColors.primaryColor),
        iconTheme: _buildIconThemeData(),
        elevatedButtonTheme: _buildElevatedButtonThemeData(),
      ),
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(AppColors.buttonBackgroundColor),
        foregroundColor:
            WidgetStateProperty.all<Color>(AppColors.buttonTextColor),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  IconThemeData _buildIconThemeData() =>
      const IconThemeData(color: AppColors.primaryColor);

  InputDecorationTheme _buildInputDecorationTheme(
    Color enabledBorderColor,
    Color focusedBorderColor,
  ) {
    return InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: enabledBorderColor,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: focusedBorderColor,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: focusedBorderColor,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
    );
  }

  TextTheme _buildTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(color: AppColors.primaryColor),
      bodyMedium: TextStyle(color: AppColors.primaryColor),
      displayLarge: TextStyle(color: AppColors.primaryColor),
      displayMedium: TextStyle(color: AppColors.primaryColor),
      displaySmall: TextStyle(color: AppColors.primaryColor),
      headlineMedium: TextStyle(color: AppColors.primaryColor),
      headlineSmall: TextStyle(color: AppColors.primaryColor),
      titleLarge: TextStyle(color: AppColors.primaryColor),
      titleMedium: TextStyle(color: AppColors.primaryColor),
      titleSmall: TextStyle(color: AppColors.primaryColor),
      labelLarge: TextStyle(color: AppColors.primaryColor),
      bodySmall: TextStyle(color: AppColors.primaryColor),
      labelSmall: TextStyle(color: AppColors.primaryColor),
    );
  }
}
