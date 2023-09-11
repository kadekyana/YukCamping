import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_des_controller.dart';

class TambahDesView extends GetView<TambahDesController> {
  const TambahDesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TambahDesView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: controller.nameC,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(label: Text('Nama Destinasi')),
                ),
                SizedBox(
                  width: 10,
                ),
                TextField(
                  controller: controller.decsC,
                  textInputAction: TextInputAction.next,
                  decoration:
                      InputDecoration(label: Text('Deskripsi Destinasi')),
                ),
                SizedBox(
                  width: 10,
                ),
                TextField(
                  controller: controller.locationC,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(label: Text('Lokasi Destinasi')),
                ),
                SizedBox(
                  width: 10,
                ),
                TextField(
                  controller: controller.packageC,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(label: Text('Package Destinasi')),
                ),
                SizedBox(
                  width: 10,
                ),
                TextField(
                  controller: controller.priceC,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(label: Text('Harga Destinasi')),
                ),
                SizedBox(
                  width: 10,
                ),
                TextField(
                  controller: controller.imgSeeC,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(label: Text('Foto Destinasi')),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () => controller.tambah(
                        controller.nameC.text,
                        controller.decsC.text,
                        controller.imgSeeC.text,
                        controller.locationC.text,
                        controller.packageC.text,
                        controller.priceC.text),
                    child: Text('Tambah'))
              ],
            ),
          ),
        ));
  }
}
