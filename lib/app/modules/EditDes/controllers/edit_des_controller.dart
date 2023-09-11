import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDesController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController decsC;
  late TextEditingController imgSeeC;
  late TextEditingController locationC;
  late TextEditingController packageC;
  late TextEditingController priceC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // OneTime Db
  Future<DocumentSnapshot<Object?>> getData(data) async {
    DocumentReference destinasi =
        firestore.collection('destination').doc('data');

    return destinasi.get();
  }

  void edit(String name, String decs, String imgSee, String location,
      String package, String price) async {
    CollectionReference tambahD = firestore.collection('destination');

    try {
      await tambahD.add({
        "name": name,
        "decs": decs,
        "imgSee": imgSee,
        "location": location,
        "package": package,
        "price": price
      });

      Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Menambah Destinasi',
          onConfirm: () {
            nameC.clear();
            decsC.clear();
            imgSeeC.clear();
            locationC.clear();
            packageC.clear();
            priceC.clear();
            Get.back();
          },
          textConfirm: 'Okay');
    } catch (e) {
      Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Menambah Destinasi',
          onConfirm: () => Get.back(),
          textConfirm: 'Okay');
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    decsC = TextEditingController();
    imgSeeC = TextEditingController();
    locationC = TextEditingController();
    priceC = TextEditingController();
    packageC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    decsC.dispose();
    imgSeeC.dispose();
    locationC.dispose();
    priceC.dispose();
    packageC.dispose();
    super.onClose();
  }
}
