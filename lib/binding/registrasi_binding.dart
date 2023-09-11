import 'package:get/get.dart';

import '../controller/registrasi_controller.dart';

class Registrasi_Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<Registrasi_Controller>(() => Registrasi_Controller());
  }
}
