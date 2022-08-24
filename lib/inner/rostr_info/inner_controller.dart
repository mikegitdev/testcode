import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InnerController extends GetxController {
  final count = 0;
  bool isPressed = false;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void pressFunction(){
    isPressed = !isPressed;
    update();
  }
}
