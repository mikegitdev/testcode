import 'package:get/get.dart';

import '../controllers/edit_alert_controller.dart';

class EditAlertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAlertController>(
      () => EditAlertController(),
    );
  }
}
