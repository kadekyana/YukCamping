import 'package:YukCamping/controller/cart_controller.dart';
import 'package:get/get.dart';

class Cart_Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CartController>(() => CartController());
  }
}
