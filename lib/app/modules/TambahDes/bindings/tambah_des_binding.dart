import 'package:get/get.dart';

import '../controllers/tambah_des_controller.dart';

class TambahDesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahDesController>(
      () => TambahDesController(),
    );
  }
}
