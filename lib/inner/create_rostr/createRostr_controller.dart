import 'package:get/get.dart';

class CreateRostrController extends GetxController {
  final enableRating = false.obs;
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

  void changeRating() {
    enableRating == true ? enableRating(false) : enableRating(true);
    update();
  }
}
