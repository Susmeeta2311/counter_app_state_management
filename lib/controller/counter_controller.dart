import 'package:get/get.dart';

class CounterController extends GetxController {
  final counter = 0.obs;

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
}
