import 'dart:developer';

import 'package:get/get.dart';

class CreateRostrController extends GetxController {
  bool enableRating = false;


  void changeRating(bool value) {
    enableRating = value;
    update();
    enableRating ? enableRating == false : enableRating == true;
    update();
    log("enableRating   $enableRating");
  }
}
