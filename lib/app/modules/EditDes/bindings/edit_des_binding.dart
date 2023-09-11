import 'package:get/get.dart';

import '../controllers/edit_des_controller.dart';

class EditDesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDesController>(
      () => EditDesController(),
    );
  }
}
