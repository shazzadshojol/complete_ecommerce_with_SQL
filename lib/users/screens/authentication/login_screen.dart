import 'package:complete_ecommerce/users/common/widgets/text_filds.dart';
import 'package:complete_ecommerce/users/controllers/sign_in_controller.dart';
import 'package:complete_ecommerce/users/screens/authentication/email_verification_screen.dart';
import 'package:complete_ecommerce/users/screens/authentication/sign_up_screen.dart';
import 'package:complete_ecommerce/users/screens/authentication/widgets/bottomTextForLoginSignup.dart';
import 'package:complete_ecommerce/users/screens/base_screens.dart';
import 'package:complete_ecommerce/users/screens/bottom_nav_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController _signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.shopping_cart,
                    size: 150,
                  ),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFields(
                            hintText: 'Email',
                            icon: const Icon(CupertinoIcons.mail),
                            controller: _signInController.emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFields(
                            hintText: 'Password',
                            icon: const Icon(CupertinoIcons.lock_slash),
                            controller: _signInController.passwordController,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                print('Form validation successful');
                                print(
                                    'Email: ${_signInController.emailController.text}');
                                print(
                                    'Password: ${_signInController.passwordController.text}');

                                final result = await _signInController.signIn(
                                  _signInController.emailController.text,
                                  _signInController.passwordController.text,
                                );

                                if (result) {
                                  Get.to(() => BottomNavBarScreen());
                                } else {
                                  Get.snackbar('Error', 'Try again');
                                }
                              } else {
                                Get.snackbar('Error',
                                    'Please fill in all fields correctly');
                              }
                            },
                            child: const Text(
                              'Sign In', // Change to 'Sign In'
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          BottomTextForLoginSignup(
                            text: 'Don\'t have an account?',
                            clickableText: 'Sign UP!',
                            onTap: () {
                              Get.to(() => const SignUpScreen());
                            },
                          ),
                          BottomTextForLoginSignup(
                            text: 'Forgot Password?',
                            clickableText: 'Recover!',
                            onTap: () {
                              Get.to(() => const EmailVerificationScreen());
                            },
                          ),
                          const Text('Or'),
                          BottomTextForLoginSignup(
                            text: 'Admin Login',
                            clickableText: 'Click here',
                            onTap: () {},
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
