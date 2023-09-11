import 'package:YukCamping/controller/cart_controller.dart';
import 'package:YukCamping/keranjang/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart_Total extends StatelessWidget {
  final CartController controller = Get.find();
  Cart_Total({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () => Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Total',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Rp.${controller.total}',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
        ]),
      ),
    );
  }
}
