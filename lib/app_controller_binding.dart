import 'package:get/instance_manager.dart';
import 'package:tasker/app_controller.dart';

import 'inner/create_rostr/createRostr_controller.dart';

class AppControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(()=>CreateRostrController());
  }
}
