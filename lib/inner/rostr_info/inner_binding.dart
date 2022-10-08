import 'package:get/get_navigation/src/root/root_controller.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/rostr_info/user_controller.dart';
import 'package:tasker/inner/rostr_info/users_groups_controller.dart';

import 'inner_controller.dart';

class InnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InnerController(),fenix: true);
    Get.lazyPut(() => CreateRostrController(),fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => UsersGroupsController(),fenix: true);
    //Get.lazyPut(() => GetMaterialController(),fenix: true);
  }
}
