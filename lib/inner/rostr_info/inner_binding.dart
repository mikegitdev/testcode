import 'package:get/instance_manager.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/rostr_info/user_controller.dart';

import 'inner_controller.dart';

class InnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InnerController(),fenix: true);
    Get.lazyPut(() => CreateRostrController(),fenix: true);
    Get.lazyPut(() => UserController(),fenix: true);
  }
}
