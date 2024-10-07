import 'package:complete_ecommerce/users/common/widgets/text_filds.dart';
import 'package:complete_ecommerce/users/controllers/email_otp_controller.dart';
import 'package:complete_ecommerce/users/screens/authentication/otp_verify_screen.dart';
import 'package:complete_ecommerce/users/screens/base_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EmailOtpController _emailOtpController = Get.find<EmailOtpController>();

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
                    CupertinoIcons.mail,
                    size: 150,
                  ),
                  const Text(
                    'Your Email',
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
                            controller: _emailOtpController.emailController,
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
                          ElevatedButton(
                            onPressed: () async {
                              // if (_formKey.currentState!.validate()) {
                              //   log('Form validation successful');
                              //   log('Email: ${_emailOtpController.emailController.text}');
                              //
                              //   final result = await _emailOtpController.signIn(
                              //     _emailOtpController.emailController.text,
                              //   );
                              //
                              //   if (result) {
                              //     Get.to(() => OtpVerifyScreen());
                              //   } else {
                              //     Get.snackbar('Error', 'Try again');
                              //   }
                              // } else {
                              //   Get.snackbar('Error',
                              //       'Please fill in all fields correctly');
                              // }
                              Get.to(() => OtpVerifyScreen());
                            },
                            child: const Text(
                              'Send Otp', // Change to 'Sign In'
                              style: TextStyle(fontSize: 18),
                            ),
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
