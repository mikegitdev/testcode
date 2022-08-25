import 'package:get/instance_manager.dart';
import 'createRostr_controller.dart';

class CreateRostrBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateRostrController());
  }
}
