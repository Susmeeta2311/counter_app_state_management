import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  final counter = 0.obs;
  final isDarkMode= false.obs;

  void incrementClicked() {
    counter.value++;
    print(counter);
  }

  void decrementClicked() {
    counter.value--;
    print(counter);
  }
  void restart() {
    counter.value = 0;
    print(counter);
  }
  void onThemeClicked(){
    isDarkMode.value= !isDarkMode.value;

    Get.changeThemeMode(isDarkMode.value? ThemeMode.dark : ThemeMode.light);
  }
}
