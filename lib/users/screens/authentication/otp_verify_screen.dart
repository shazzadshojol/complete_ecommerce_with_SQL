import 'dart:developer';

import 'package:complete_ecommerce/users/screens/authentication/change_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.number_square,
              size: 150,
            ),
            const Text(
              'Your Email',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 20),
            OTPTextField(
              otpFieldStyle: OtpFieldStyle(
                  borderColor: Colors.white,
                  enabledBorderColor: Colors.white,
                  disabledBorderColor: Colors.white),
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 60,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                log("Completed: $pin");
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                Get.to(() => ChangePasswordScreen());
              },
              child: const Text(
                'Verify Otp', // Change to 'Sign In'
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
