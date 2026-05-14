import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void nextPage() {
    if (currentIndex.value < 3) {
      currentIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void jumpToPage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}
