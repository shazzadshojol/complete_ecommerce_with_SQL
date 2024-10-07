import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var selectedPage = 0.obs;

  void changePage(int index) {
    selectedPage.value = index;
  }
}
