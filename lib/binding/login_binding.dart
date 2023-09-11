import 'package:YukCamping/controller/login_controller.dart';
import 'package:get/get.dart';

class Login_Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<Login_Controller>(() => Login_Controller());
  }
}
