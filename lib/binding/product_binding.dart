import 'package:YukCamping/controller/cart_controller.dart';
import 'package:YukCamping/controller/profile_controller.dart';
import 'package:get/get.dart';

class Product_Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CartController>(() => CartController());
  }
}
