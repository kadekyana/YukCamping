import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_des_controller.dart';

class EditDesView extends GetView<EditDesController> {
  EditDesView({Key? key, required this.data}) : super(key: key);
  final EditDesController controller = Get.put(EditDesController());
  final String data;
  // ignore: recursive_getters
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditDesView'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(data),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var hasil = snapshot.data!.data() as Map<String, dynamic>?;
            return Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: controller.nameC,
                      textInputAction: TextInputAction.next,
                      decoration:
                          InputDecoration(label: Text('Nama Destinasi')),
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
                      decoration:
                          InputDecoration(label: Text('Lokasi Destinasi')),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextField(
                      controller: controller.packageC,
                      textInputAction: TextInputAction.next,
                      decoration:
                          InputDecoration(label: Text('Package Destinasi')),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextField(
                      controller: controller.priceC,
                      textInputAction: TextInputAction.next,
                      decoration:
                          InputDecoration(label: Text('Harga Destinasi')),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextField(
                      controller: controller.imgSeeC,
                      textInputAction: TextInputAction.next,
                      decoration:
                          InputDecoration(label: Text('Foto Destinasi')),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () => controller.edit(
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
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
