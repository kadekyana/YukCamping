import 'package:get/get.dart';

import '../controllers/admin_des_controller.dart';

class AdminDesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDesController>(
      () => AdminDesController(),
    );
  }
}
