import 'package:YukCamping/core.dart';
import 'package:YukCamping/keranjang/cart_item.dart';
import 'package:YukCamping/keranjang/cart_total.dart';
import 'package:YukCamping/navbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';

class Cart extends StatelessWidget {
  final CartController controller = Get.find();
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 600,
        child: ListView.builder(
          itemCount: controller.item.length,
          itemBuilder: (BuildContext context, int index) {
            return CartProductCard(
                controller: controller,
                item: controller.item.keys.toList()[index],
                jumlah: controller.item.values.toList()[index],
                index: index);
          },
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final CartItem item;
  final int jumlah;
  final int index;

  CartProductCard(
      {Key? key,
      required this.controller,
      required this.item,
      required this.jumlah,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(controller.item);
    }
    // TODO: implement build
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black)),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(item.ImgSee),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              item.name,
              style: TextStyle(fontSize: 14),
            ),
          ),
          IconButton(
              onPressed: () {
                controller.kurangItem(item);
              },
              icon: Icon(
                Icons.remove_circle,
              )),
          Text(
            '${jumlah}',
          ),
          IconButton(
              onPressed: () {
                controller.tambahItemCart(item);
              },
              icon: Icon(
                Icons.add_circle,
              )),
        ],
      ),
    );
  }
}
