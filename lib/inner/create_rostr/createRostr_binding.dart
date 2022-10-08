import 'package:get/instance_manager.dart';
import '../rostr_info/user_controller.dart';
import 'createRostr_controller.dart';

class CreateRostrBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateRostrController());
    Get.lazyPut(() => UserController(),fenix: true);
  }
}
