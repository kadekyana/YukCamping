import 'package:YukCamping/controller/profile_controller.dart';
import 'package:get/get.dart';

class Profile_Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<Profile_Controller>(() => Profile_Controller());
  }
}
