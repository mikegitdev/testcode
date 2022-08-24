import 'package:get/instance_manager.dart';

import 'inner_controller.dart';

class InnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InnerController());
  }
}
