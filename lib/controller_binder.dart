import 'package:complete_ecommerce/users/controllers/bottom_nav_controller.dart';
import 'package:complete_ecommerce/users/controllers/email_otp_controller.dart';
import 'package:complete_ecommerce/users/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

import 'users/controllers/sign_in_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(BottomNavBarController());
    Get.put(EmailOtpController());
  }
}
